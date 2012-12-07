// ======================================================================
// Author : $Author$
// Version: $Revision$
// Date   : $Date$
// Url    : $URL$
// ======================================================================

// ======================================================================
// Copyright: (C) 2012 Gregor Cramer
// ======================================================================

/*
 * TkDND_XDND.h -- Tk XDND Drag'n'Drop Protocol Implementation
 *
 *    This file implements the unix portion of the drag&drop mechanism
 *    for the tk toolkit. The protocol in use under unix is the
 *    XDND protocol.
 *
 * This software is copyrighted by:
 * Georgios Petasis, Athens, Greece.
 * e-mail: petasisg@yahoo.gr, petasis@iit.demokritos.gr
 *
 * The following terms apply to all files associated
 * with the software unless explicitly disclaimed in individual files.
 *
 * The authors hereby grant permission to use, copy, modify, distribute,
 * and license this software and its documentation for any purpose, provided
 * that existing copyright notices are retained in all copies and that this
 * notice is included verbatim in any distributions. No written agreement,
 * license, or royalty fee is required for any of the authorized uses.
 * Modifications to this software may be copyrighted by their authors
 * and need not follow the licensing terms described here, provided that
 * the new terms are clearly indicated on the first page of each file where
 * they apply.
 *
 * IN NO EVENT SHALL THE AUTHORS OR DISTRIBUTORS BE LIABLE TO ANY PARTY
 * FOR DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES
 * ARISING OUT OF THE USE OF THIS SOFTWARE, ITS DOCUMENTATION, OR ANY
 * DERIVATIVES THEREOF, EVEN IF THE AUTHORS HAVE BEEN ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 * THE AUTHORS AND DISTRIBUTORS SPECIFICALLY DISCLAIM ANY WARRANTIES,
 * INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE, AND NON-INFRINGEMENT.  THIS SOFTWARE
 * IS PROVIDED ON AN "AS IS" BASIS, AND THE AUTHORS AND DISTRIBUTORS HAVE
 * NO OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR
 * MODIFICATIONS.
 */
#include "tcl.h"
#include "tk.h"
#include <stdlib.h>
#include <X11/Xlib.h>
#include <X11/X.h>
#include <X11/Xatom.h>
#include <X11/keysym.h>

#ifdef HAVE_LIMITS_H
#include "limits.h"
#else
#define LONG_MAX 0x7FFFFFFFL
#endif

#define XDND_VERSION 5

#define GNOME_SUPPORT
//#define DEBUG_CLIENTMESSAGE_HANDLER

#ifndef PACKAGE_NAME
# define PACKAGE_NAME "tkDND"
#endif

#ifndef PACKAGE_VERSION
# define PACKAGE_VERSION "2.3"
#endif

#define TKDND_SET_XDND_PROPERTY_ON_TOPLEVEL

#define TkDND_TkWin(x) \
  (Tk_NameToWindow(interp, Tcl_GetString(x), Tk_MainWindow(interp)))

extern Tk_Cursor TkDND_GetCursor(Tcl_Interp *interp, Tcl_Obj *name);
extern void TkDND_InitialiseCursors(Tcl_Interp *interp);

int
TkDND_Eval(Tcl_Interp* interp, int objc, Tcl_Obj* const* objv)
{
  int i;
  int status;

  for (i = 0; i < objc; ++i)
    Tcl_IncrRefCount(objv[i]);
  status = Tcl_EvalObjv(interp, objc, objv, TCL_EVAL_GLOBAL);
  if (status != TCL_OK)
    Tk_BackgroundError(interp);
  for (i = 0; i < objc; ++i)
    Tcl_DecrRefCount(objv[i]);
  return status;
}

#ifdef GNOME_SUPPORT

# include <string.h>

# ifdef USE_TKINT_H
#  include "tkInt.h"
# endif

static Tk_Window
GetWmFrameChild(Tk_Window tkwin) {
  if (Tk_PathName(tkwin) == NULL) {
    Window    xroot;
    Window    xwmwin;
    Window*   childs;
    unsigned  nchilds;

    if (XQueryTree(Tk_Display(tkwin), Tk_WindowId(tkwin),
                   &xroot, &xwmwin, &childs, &nchilds) && childs) {
      /* This is GNOME. We have to use the child window. */
      if (nchilds == 1) {
        tkwin = Tk_IdToWindow(Tk_Display(tkwin), childs[0]);
      } else if (nchilds == 2) {
        /* In this case we have to disqualify the menu bar. */
        Tk_Window win1 = Tk_IdToWindow(Tk_Display(tkwin), childs[0]);
        Tk_Window win2 = Tk_IdToWindow(Tk_Display(tkwin), childs[1]);

        char const* p1 = Tk_PathName(win1);
        char const* p2 = Tk_PathName(win2);

        if (p1 && p2) {
          char const* s1 = strchr(p1, '#');
          char const* s2 = strchr(p2, '#');

          if ((s1 == NULL) != (s2 == NULL)) {
            tkwin = s1 ? win2 : win1;
          }
        }
      }
      XFree(childs);
    }
  }

  return tkwin;
}

static Tk_Window
CoordsToWindow(int rootX, int rootY, Tk_Window tkwin) {
  Tk_Window mouse_tkwin;
  int baseX, baseY;
  int childX, childY;

  tkwin = GetWmFrameChild(tkwin);

  if (Tk_PathName(tkwin) == NULL)
    return NULL; /* something was going wrong */

  Tk_GetRootCoords(tkwin, &childX, &childY);
  baseX = rootX - childX;
  baseY = rootY - childY;
  mouse_tkwin = tkwin;

  while (tkwin != NULL) {
#ifdef USE_TKINT_H
    TkWindow* winPtr = ((TkWindow*)tkwin)->childList;
    tkwin = NULL;

    for ( ; winPtr != NULL; winPtr = winPtr->nextPtr) {
      if (!(winPtr->flags & TK_ANONYMOUS_WINDOW)) {
        Tk_Window child = (Tk_Window)winPtr;

        if (Tk_IsMapped(winPtr)) {
          int width = Tk_Width(child);
          int height = Tk_Height(child);

          if (Tk_IsTopLevel(child)) {
            Tk_GetRootCoords(child, &childX, &childY);

            if (   childX <= rootX
                && childY <= rootY
                && rootX < childX + width
                && rootY < childY + height) {
              tkwin = child;
              mouse_tkwin = child;
              break;
            }
          } else {
            int x = Tk_X(child);
            int y = Tk_Y(child);

          	if (   x <= baseX
                && y <= baseY
                && baseX < x + width
                && baseY < y + height) {
              tkwin = child;
              mouse_tkwin = child;
              baseX -= x;
              baseY -= y;
              break;
            }
          }
        }
      }
    }
#else
    Tcl_Interp* interp = Tk_Interp(tkwin);
    Tcl_Obj* objv[3];
    Tcl_Obj* result;
    int length, i;

    objv[0] = Tcl_NewStringObj("winfo", -1);
    objv[1] = Tcl_NewStringObj("children", -1);
    objv[2] = Tcl_NewStringObj(Tk_PathName(tkwin), -1);

    if (TkDND_Eval(interp, 3, objv) != TCL_OK)
      return NULL;

    result = Tcl_GetObjResult(interp);
    Tcl_IncrRefCount(result);
    tkwin = NULL;

    if (Tcl_ListObjLength(interp, result, &length) == TCL_OK) {
      for (i = 0; i < length; ++i) {
        Tcl_Obj* path;
        Tk_Window child;

        if (Tcl_ListObjIndex(interp, result, i, &path) == TCL_OK) {
          child = Tk_NameToWindow(interp, Tcl_GetString(path), mouse_tkwin);

          if (child != NULL && Tk_IsMapped(child)) {
            int width = Tk_Width(child);
            int height = Tk_Height(child);

            if (Tk_IsTopLevel(child)) {
              Tk_GetRootCoords(child, &childX, &childY);

              if (   childX <= rootX
                  && childY <= rootY
                  && rootX < childX + width
                  && rootY < childY + height) {
                tkwin = child;
                mouse_tkwin = child;
                break;
              }
            } else {
              int x = Tk_X(child);
              int y = Tk_Y(child);

              if (   x <= baseX
                  && y <= baseY
                  && baseX < x + width
                  && baseY < y + height) {
                tkwin = child;
                mouse_tkwin = child;
                baseX -= x;
                baseY -= y;
                break;
              }
            }
          }
        }
      }
    }

    Tcl_DecrRefCount(result);
#endif
  }

  return mouse_tkwin;
}

static void
SetWmFrameAware(Tk_Window path) {
  Tk_Window toplevel = path;
  Display*  display  = Tk_Display(path);
  Window    xroot;
  Window    xwmwin;
  Window*   childs;
  unsigned  nchilds;

  while (!Tk_IsTopLevel(toplevel)) {
    toplevel = Tk_Parent(toplevel);
    if (!toplevel)
      return;
  }

  if (!Tk_IsMapped(toplevel)) {
    /* What a pitty, no window manager frame exists. */
    return;
  }

  if (XQueryTree(display, Tk_WindowId(toplevel),
                 &xroot, &xwmwin, &childs, &nchilds)) {
    if (xwmwin != None &&
        xwmwin != RootWindow(display, Tk_ScreenNumber(path))) {
      Atom version = XDND_VERSION;
      /* Set XdndAware to window manager frame, otherwise GNOME will not work. */
      XChangeProperty(Tk_Display(toplevel), xwmwin,
                      Tk_InternAtom(path, "XdndAware"),
                      XA_ATOM, 32, PropModeReplace,
                      (unsigned char *) &version, 1);
    }
    if (childs)
      XFree(childs);
  }
}

#endif

Tk_Window TkDND_GetToplevelFromWrapper(Tk_Window tkwin) {
#if 0
  Window root_return, parent, *children_return = 0;
  unsigned int nchildren_return;
  Tk_Window toplevel = NULL;
  if (tkwin == NULL || Tk_IsTopLevel(tkwin))
    return tkwin;
  XQueryTree(Tk_Display(tkwin), Tk_WindowId(tkwin),
           &root_return, &parent,
           &children_return, &nchildren_return);
  if (nchildren_return == 1) {
    toplevel = Tk_IdToWindow(Tk_Display(tkwin), children_return[0]);
  }
  if (children_return) XFree(children_return);
  return toplevel;
#else
  return tkwin;
#endif
}

void TkDND_Dict_PutLong(Tcl_Interp* interp, Tcl_Obj* dict, char const* key, long long value) {
  Tcl_DictObjPut(interp, dict, Tcl_NewStringObj(key, -1), Tcl_NewWideIntObj(value));
}

void TkDND_Dict_PutInt(Tcl_Interp* interp, Tcl_Obj* dict, char const* key, long value) {
  Tcl_DictObjPut(interp, dict, Tcl_NewStringObj(key, -1), Tcl_NewLongObj(value));
}

void TkDND_Dict_Put(Tcl_Interp* interp, Tcl_Obj* dict, char const* key, char const* value) {
  Tcl_DictObjPut(interp, dict, Tcl_NewStringObj(key, -1), Tcl_NewStringObj(value, -1));
}

int TkDND_RegisterTypesObjCmd(ClientData clientData, Tcl_Interp *interp,
                              int objc, Tcl_Obj *CONST objv[]) {

  Atom version       = XDND_VERSION;

  if (objc != 4) {
    Tcl_WrongNumArgs(interp, 1, objv, "path toplevel types-list");
    return TCL_ERROR;
  }

  Tk_Window path     = TkDND_TkWin(objv[1]);

  if (!path)
    return TCL_ERROR;

  /*
   * We must make the toplevel that holds this widget XDND aware. This means
   * that we have to set the XdndAware property on our toplevel.
   */
  Tk_MakeWindowExist(path);

  XChangeProperty(Tk_Display(path), Tk_WindowId(path),
                  Tk_InternAtom(path, "XdndAware"),
                  XA_ATOM, 32, PropModeReplace,
                  (unsigned char *) &version, 1);

#ifdef GNOME_SUPPORT
  /* For GNOME support we have to set the awareness to the window manager
   * frame, this requires that the toplevel window is already mapped. We
   * will not do this mapping implicitly, the TCL side should care about this.
   * One problem remains: if the user is switching the window manager,
   * the awareness will get lost. Due to the fact that we cannot catch the
   * ReparentNotify event - this event is encapsulated inside the Tk library -
   * we have to live with this. Furthermore GNOME's decision is causing much
   * superfluous X traffic. GNOME's decision for the window manager frame,
   * which is not belonging to our own process, is nonsense.
  */
  SetWmFrameAware(path);
#endif

  return TCL_OK;
} /* TkDND_RegisterTypesObjCmd */

int TkDND_HandleXdndEnter(Tk_Window tkwin, XClientMessageEvent *cm) {
  Tcl_Interp *interp = Tk_Interp(tkwin);
  Atom *typelist;
  const long *l = cm->data.l;
  int i, version = (int)(((unsigned long)(l[1])) >> 24);
  Window drag_source;
  Tcl_Obj* objv[4], *element;

  if (interp == NULL)
    return False;
  if (version > XDND_VERSION)
    return False;
  if (version < 3)
    return False;
  drag_source = l[0];
  if (l[1] & 0x1UL) {
    /* Get the types from XdndTypeList property. */
    Atom actualType = None;
    int actualFormat;
    unsigned long itemCount, remainingBytes;
    unsigned char *data;
    XGetWindowProperty(cm->display, drag_source,
                       Tk_InternAtom(tkwin, "XdndTypeList"), 0,
                       LONG_MAX, False, XA_ATOM, &actualType, &actualFormat,
                       &itemCount, &remainingBytes, &data);
    typelist = (Atom *) Tcl_Alloc(sizeof(Atom)*(itemCount+1));
    if (typelist == NULL)
      return False;
    for (i=0; i<itemCount; i++) { typelist[i] = ((Atom*)data)[i]; }
    typelist[itemCount] = None;
    if (data) XFree(data);
  } else {
    typelist = (Atom *) Tcl_Alloc(sizeof(Atom)*4);
    if (typelist == NULL)
      return False;
    typelist[0] = cm->data.l[2];
    typelist[1] = cm->data.l[3];
    typelist[2] = cm->data.l[4];
    typelist[3] = None;
  }
  /* We have all the information we need. Its time to pass it at the Tcl level.*/
  objv[0] = Tcl_NewStringObj("tkdnd::xdnd::_HandleXdndEnter", -1);
  objv[1] = Tcl_NewStringObj(Tk_PathName(TkDND_GetToplevelFromWrapper(tkwin)), -1);
  objv[2] = Tcl_NewLongObj(drag_source);
  objv[3] = Tcl_NewListObj(0, NULL);
  for (i=0; typelist[i] != None; ++i) {
    element = Tcl_NewStringObj(Tk_GetAtomName(tkwin, typelist[i]), -1);
    Tcl_ListObjAppendElement(NULL, objv[3], element);
  }
  TkDND_Eval(Tk_Interp(tkwin), 4, objv);
  Tcl_Free((char *) typelist);
  return True;
} /* TkDND_HandleXdndEnter */

int TkDND_HandleXdndPosition(Tk_Window tkwin, XClientMessageEvent *cm) {
  Tcl_Interp *interp = Tk_Interp(tkwin);
  Tk_Window mouse_tkwin = NULL;
  Tcl_Obj* result;
  Tcl_Obj* objv[5];
  const unsigned long *l = (const unsigned long *) cm->data.l;
  int rootX, rootY, index, status;
  XClientMessageEvent response;
  int width = 1, height = 1;
  static char *DropActions[] = {
    "copy", "move", "link", "ask",  "private", "refuse_drop", "default",
    (char *) NULL
  };
  enum dropactions {
    ActionCopy, ActionMove, ActionLink, ActionAsk, ActionPrivate,
    refuse_drop, ActionDefault
  };

  if (interp == NULL)
    return False;

  rootX = (l[2] & 0xffff0000) >> 16;
  rootY =  l[2] & 0x0000ffff;

#ifdef GNOME_SUPPORT
  if (Tk_PathName(tkwin) == NULL) {
    /* The GNOME shape is confusing Tk_CoordsToWindow(), because this shape has
     * the root window as parent. What the hell is GNOME doing? */
    mouse_tkwin = CoordsToWindow(rootX, rootY, tkwin);
  }
#endif
  if (mouse_tkwin == NULL) {
    mouse_tkwin = Tk_CoordsToWindow(rootX, rootY, tkwin);
    if (mouse_tkwin == NULL) {
      int dx, dy;
      Tk_GetRootCoords(tkwin, &dx, &dy);
      mouse_tkwin = Tk_CoordsToWindow(rootX + dx, rootY + dy, tkwin);
    }
  }
  /* Ask the Tk widget whether it will accept the drop... */
  index = refuse_drop;
  if (mouse_tkwin != NULL) {
    objv[0] = Tcl_NewStringObj("tkdnd::xdnd::_HandleXdndPosition", -1);
    objv[1] = Tcl_NewStringObj(Tk_PathName(mouse_tkwin), -1);
    objv[2] = Tcl_NewIntObj(rootX);
    objv[3] = Tcl_NewIntObj(rootY);
    objv[4] = Tcl_NewLongObj(cm->data.l[0]);
    if (TkDND_Eval(Tk_Interp(tkwin), 5, objv) == TCL_OK) {
      /* Get the returned action... */
      result = Tcl_GetObjResult(interp); Tcl_IncrRefCount(result);
      status = Tcl_GetIndexFromObj(interp, result, (const char **) DropActions,
                              "dropactions", 0, &index);
      Tcl_DecrRefCount(result);
      if (status != TCL_OK) index = refuse_drop;
    }
  }
  /* Sent */
  memset (&response, 0, sizeof(response));
  response.type         = ClientMessage;
  response.format       = 32;
  response.window       = cm->data.l[0];
  response.message_type = Tk_InternAtom(tkwin, "XdndStatus");
  response.data.l[0]    = Tk_WindowId(tkwin);
  response.data.l[1]    = 1; /* yes */
  response.data.l[2]    = ((rootX) << 16) | ((rootY)  & 0xFFFFUL); /* x, y */
  response.data.l[3]    = ((width) << 16) | ((height) & 0xFFFFUL); /* w, h */
  response.data.l[4]    = 0; /* action */
  switch ((enum dropactions) index) {
    case ActionDefault:
    case ActionCopy:
      response.data.l[4] = Tk_InternAtom(tkwin, "XdndActionCopy");    break;
    case ActionMove:
      response.data.l[4] = Tk_InternAtom(tkwin, "XdndActionMove");    break;
    case ActionLink:
      response.data.l[4] = Tk_InternAtom(tkwin, "XdndActionLink");    break;
    case ActionAsk:
      response.data.l[4] = Tk_InternAtom(tkwin, "XdndActionAsk");     break;
    case ActionPrivate:
      response.data.l[4] = Tk_InternAtom(tkwin, "XdndActionPrivate"); break;
    case refuse_drop: {
      response.data.l[1] = 0; /* Refuse drop. */
    }
  }
  XSendEvent(cm->display, response.window, False, NoEventMask,
             (XEvent*)&response);
  return True;
} /* TkDND_HandleXdndPosition */

int TkDND_HandleXdndLeave(Tk_Window tkwin, XClientMessageEvent *cm) {
  Tcl_Interp *interp = Tk_Interp(tkwin);
  Tcl_Obj* objv[1];
  if (interp == NULL)
    return False;
  objv[0] = Tcl_NewStringObj("tkdnd::xdnd::_HandleXdndLeave", -1);
  TkDND_Eval(Tk_Interp(tkwin), 1, objv);
  return True;
} /* TkDND_HandleXdndLeave */

int TkDND_HandleXdndDrop(Tk_Window tkwin, XClientMessageEvent *cm) {
  XClientMessageEvent finished;
  Tcl_Interp *interp = Tk_Interp(tkwin);
  Tcl_Obj* objv[2], *result;
  int status, index;
  Time time = (sizeof(Time) == 8 && cm->data.l[2] < 0) ? (unsigned)cm->data.l[2] : cm->data.l[2];
  static char *DropActions[] = {
    "copy", "move", "link", "ask",  "private", "refuse_drop", "default",
    (char *) NULL
  };
  enum dropactions {
    ActionCopy, ActionMove, ActionLink, ActionAsk, ActionPrivate,
    refuse_drop, ActionDefault
  };

  if (interp == NULL)
    return False;

  /* Call out Tcl callback. */
  objv[0] = Tcl_NewStringObj("tkdnd::xdnd::_HandleXdndDrop", -1);
  objv[1] = Tcl_NewLongObj(time);
  if (TkDND_Eval(Tk_Interp(tkwin), 2, objv) == TCL_OK) {
    finished.data.l[1] = 1; /* Accept drop. */
    /* Get the returned action... */
    result = Tcl_GetObjResult(interp); Tcl_IncrRefCount(result);
    status = Tcl_GetIndexFromObj(interp, result, (const char **) DropActions,
                            "dropactions", 0, &index);
    Tcl_DecrRefCount(result);
    if (status != TCL_OK) index = refuse_drop;
    switch ((enum dropactions) index) {
      case ActionDefault:
      case ActionCopy:
        finished.data.l[2] = Tk_InternAtom(tkwin, "XdndActionCopy");    break;
      case ActionMove:
        finished.data.l[2] = Tk_InternAtom(tkwin, "XdndActionMove");    break;
      case ActionLink:
        finished.data.l[2] = Tk_InternAtom(tkwin, "XdndActionLink");    break;
      case ActionAsk:
        finished.data.l[2] = Tk_InternAtom(tkwin, "XdndActionAsk");     break;
      case ActionPrivate:
        finished.data.l[2] = Tk_InternAtom(tkwin, "XdndActionPrivate"); break;
      case refuse_drop: {
        finished.data.l[1] = 0; /* Drop canceled. */
      }
    }
  } else {
    finished.data.l[1] = 0;
  }
  /* Send XdndFinished. */
  finished.type         = ClientMessage;
  finished.format       = 32;
  finished.window       = cm->data.l[0];
  finished.message_type = Tk_InternAtom(tkwin, "XdndFinished");
  finished.data.l[0]    = Tk_WindowId(tkwin);
  XSendEvent(cm->display, finished.window, False, NoEventMask,
             (XEvent*)&finished);
  return True;
} /* TkDND_HandleXdndDrop */

int TkDND_HandleXdndStatus(Tk_Window tkwin, XClientMessageEvent *cm) {
  Tcl_Interp *interp = Tk_Interp(tkwin);
  Tcl_Obj *objv[2];
  Atom action;

  if (interp == NULL)
     return False;

  objv[0] = Tcl_NewStringObj("tkdnd::xdnd::_HandleXdndStatus", -1);
  objv[1] = Tcl_NewDictObj();
  /* data.l[0] contains the XID of the target window */
  TkDND_Dict_PutLong(interp, objv[1], "target", cm->data.l[0]);
  /* data.l[1] bit 0 is set if the current target will accept the drop */
  TkDND_Dict_PutInt(interp, objv[1], "accept", cm->data.l[1] & 0x1L ? 1 : 0);
  /* data.l[1] bit 1 is set if the target wants XdndPosition messages while
   * the mouse moves inside the rectangle in data.l[2,3] */
  TkDND_Dict_PutInt(interp, objv[1], "want_position", cm->data.l[1] & 0x2UL ? 1 : 0);
  /* data.l[4] contains the action accepted by the target */
  action = cm->data.l[4];
  if (action == Tk_InternAtom(tkwin, "XdndActionCopy")) {
    TkDND_Dict_Put(interp, objv[1], "action", "copy");
  } else if (action == Tk_InternAtom(tkwin, "XdndActionMove")) {
    TkDND_Dict_Put(interp, objv[1], "action", "move");
  } else if (action == Tk_InternAtom(tkwin, "XdndActionLink")) {
    TkDND_Dict_Put(interp, objv[1], "action", "link");
  } else if (action == Tk_InternAtom(tkwin, "XdndActionAsk")) {
    TkDND_Dict_Put(interp, objv[1], "action", "ask");
  } else if (action == Tk_InternAtom(tkwin, "XdndActionPrivate")) {
    TkDND_Dict_Put(interp, objv[1], "action", "private");
  } else {
    TkDND_Dict_Put(interp, objv[1], "action", "refuse_drop");
  }
  TkDND_Dict_PutInt(interp, objv[1], "x", cm->data.l[2] >> 16);
  TkDND_Dict_PutInt(interp, objv[1], "y", cm->data.l[2] & 0xffffL);
  TkDND_Dict_PutInt(interp, objv[1], "w", cm->data.l[3] >> 16);
  TkDND_Dict_PutInt(interp, objv[1], "h", cm->data.l[3] & 0xffffL);

  TkDND_Eval(interp, 2, objv);
  return True;
} /* TkDND_HandleXdndStatus */

int TkDND_HandleXdndFinished(Tk_Window tkwin, XClientMessageEvent *cm) {
  Tcl_Interp *interp = Tk_Interp(tkwin);
  Tcl_Obj *objv[2];
  Atom action;

  if (interp == NULL)
    return False;

  objv[0] = Tcl_NewStringObj("tkdnd::xdnd::_HandleXdndFinished", -1);
  objv[1] = Tcl_NewDictObj();
  /* data.l[0] contains the XID of the target window */
  TkDND_Dict_PutLong(interp, objv[1], "target", cm->data.l[0]);
  /* data.l[1] bit 0 is set if the current target accepted the drop and
   *  successfully performed the accepted drop action */
  TkDND_Dict_PutInt(interp, objv[1], "accept", cm->data.l[1] & 0x1L ? 1 : 0);
  /* data.l[2] contains the action performed by the target */
  action = cm->data.l[2];
  if (action == Tk_InternAtom(tkwin, "XdndActionCopy")) {
    TkDND_Dict_Put(interp, objv[1], "action", "copy");
  } else if (action == Tk_InternAtom(tkwin, "XdndActionMove")) {
    /* In general, XdndActionMove is implemented by first requesting the data and then
     * the special target DELETE defined in the X Selection protocol. (File managers will
     * obviously just use mv or its equivalent.) DELETE should be sent before XdndFinished.
     */
    TkDND_Dict_Put(interp, objv[1], "action", "move");
  } else if (action == Tk_InternAtom(tkwin, "XdndActionLink")) {
    TkDND_Dict_Put(interp, objv[1], "action", "link");
  } else if (action == Tk_InternAtom(tkwin, "XdndActionAsk")) {
    TkDND_Dict_Put(interp, objv[1], "action", "ask");
  } else if (action == Tk_InternAtom(tkwin, "XdndActionPrivate")) {
    TkDND_Dict_Put(interp, objv[1], "action", "private");
  } else {
    TkDND_Dict_Put(interp, objv[1], "action", "refuse_drop");
  }
  TkDND_Eval(interp, 2, objv);
  return True;
} /* TkDND_HandleXdndFinished */

static int TkDND_XDNDHandler(Tk_Window tkwin, XEvent *xevent) {
  XClientMessageEvent *clientMessage;
  if (xevent->type != ClientMessage)
    return False;
  clientMessage = &xevent->xclient;

  if (clientMessage->message_type == Tk_InternAtom(tkwin, "XdndPosition")) {
#ifdef DEBUG_CLIENTMESSAGE_HANDLER
    printf("XDND_HandleClientMessage: Received XdndPosition\n");
#endif /* DEBUG_CLIENTMESSAGE_HANDLER */
    return TkDND_HandleXdndPosition(tkwin, clientMessage);
  } else if (clientMessage->message_type == Tk_InternAtom(tkwin, "XdndEnter")) {
#ifdef DEBUG_CLIENTMESSAGE_HANDLER
    printf("XDND_HandleClientMessage: Received XdndEnter\n");
#endif /* DEBUG_CLIENTMESSAGE_HANDLER */
    return TkDND_HandleXdndEnter(tkwin, clientMessage);
  } else if (clientMessage->message_type == Tk_InternAtom(tkwin, "XdndStatus")) {
#ifdef DEBUG_CLIENTMESSAGE_HANDLER
    printf("XDND_HandleClientMessage: Received XdndStatus\n");
#endif /* DEBUG_CLIENTMESSAGE_HANDLER */
    return TkDND_HandleXdndStatus(tkwin, clientMessage);
  } else if (clientMessage->message_type == Tk_InternAtom(tkwin, "XdndLeave")) {
#ifdef DEBUG_CLIENTMESSAGE_HANDLER
    printf("XDND_HandleClientMessage: Received XdndLeave\n");
#endif /* DEBUG_CLIENTMESSAGE_HANDLER */
    return TkDND_HandleXdndLeave(tkwin, clientMessage);
  } else if (clientMessage->message_type == Tk_InternAtom(tkwin, "XdndDrop")) {
#ifdef DEBUG_CLIENTMESSAGE_HANDLER
    printf("XDND_HandleClientMessage: Received XdndDrop\n");
#endif /* DEBUG_CLIENTMESSAGE_HANDLER */
    return TkDND_HandleXdndDrop(tkwin, clientMessage);
  } else if (clientMessage->message_type == Tk_InternAtom(tkwin, "XdndFinished")) {
#ifdef DEBUG_CLIENTMESSAGE_HANDLER
    printf("XDND_HandleClientMessage: Received XdndFinished\n");
#endif /* DEBUG_CLIENTMESSAGE_HANDLER */
    return TkDND_HandleXdndFinished(tkwin, clientMessage);
  }
  return False;
} /* TkDND_XDNDHandler */

#if 0 // we don't need this hack
int TkDND_GetSelectionObjCmd(ClientData clientData, Tcl_Interp *interp,
                             int objc, Tcl_Obj *CONST objv[]) {
  Time time;
  Tk_Window path;
  Atom selection;

  if (objc != 4) {
    Tcl_WrongNumArgs(interp, 1, objv, "path time type");
    return TCL_ERROR;
  }

  if (Tcl_GetLongFromObj(interp, objv[2], (long *) &time) != TCL_OK) {
    return TCL_ERROR;
  }

  path      = TkDND_TkWin(objv[1]);
  selection = Tk_InternAtom(path, "XdndSelection");

  XConvertSelection(Tk_Display(path), selection,
                    Tk_InternAtom(path, Tcl_GetString(objv[3])),
                    selection, Tk_WindowId(path), time);
  return TCL_OK;
} /* TkDND_GetSelectionObjCmd */

int TkDND_GrabPointerObjCmd(ClientData clientData, Tcl_Interp *interp, int objc, Tcl_Obj *CONST objv[]) {
  Tk_Window path;
  Tk_Cursor cursor;

  if (objc != 3) {
    Tcl_WrongNumArgs(interp, 1, objv, "path cursor");
    return TCL_ERROR;
  }

  path = TkDND_TkWin(objv[1]);
  if (!path)
    return TCL_ERROR;
  Tk_MakeWindowExist(path);

  cursor = TkDND_GetCursor(interp, objv[2]);
  if (cursor == None) {
    Tcl_SetResult(interp, "invalid cursor name: ", TCL_STATIC);
    Tcl_AppendResult(interp, Tcl_GetString(objv[2]));
    return TCL_ERROR;
  }

  if (XGrabPointer(Tk_Display(path), Tk_WindowId(path), False,
       ButtonPressMask   | ButtonReleaseMask |
       PointerMotionMask | EnterWindowMask   | LeaveWindowMask,
       GrabModeAsync, GrabModeAsync,
       None, (Cursor) cursor, CurrentTime) != GrabSuccess) {
    Tcl_SetResult(interp, "unable to grab mouse pointer", TCL_STATIC);
    return TCL_ERROR;
  }
  return TCL_OK;
}; /* TkDND_GrabPointerObjCmd */

int TkDND_UnrabPointerObjCmd(ClientData clientData, Tcl_Interp *interp, int objc, Tcl_Obj *CONST objv[]) {
  Tk_Window path;
  if (objc != 2) {
    Tcl_WrongNumArgs(interp, 1, objv, "path");
    return TCL_ERROR;
  }
  path = TkDND_TkWin(objv[1]);
  if (!path)
    return TCL_ERROR;
  XUngrabPointer(Tk_Display(path), CurrentTime);
  return TCL_OK;
}; /* TkDND_GrabPointerObjCmd */
#endif

int TkDND_SetPointerCursorObjCmd(ClientData clientData, Tcl_Interp *interp,
                            int objc, Tcl_Obj *CONST objv[]) {
  Tk_Window path;
  Tk_Cursor cursor;

  if (objc != 3) {
    Tcl_WrongNumArgs(interp, 1, objv, "path cursor");
    return TCL_ERROR;
  }

  path = TkDND_TkWin(objv[1]);
  if (!path)
    return TCL_ERROR;
  Tk_MakeWindowExist(path);

  cursor = TkDND_GetCursor(interp, objv[2]);
  if (cursor == None) {
    Tcl_SetResult(interp, "invalid cursor name: ", TCL_STATIC);
    Tcl_AppendResult(interp, Tcl_GetString(objv[2]));
    return TCL_ERROR;
  }

  if (XChangeActivePointerGrab(Tk_Display(path),
       ButtonPressMask   | ButtonReleaseMask |
       PointerMotionMask | EnterWindowMask   | LeaveWindowMask,
       (Cursor) cursor, CurrentTime) != GrabSuccess) {
    /* Tcl_SetResult(interp, "unable to update mouse pointer", TCL_STATIC);
       return TCL_ERROR; */
  }
  return TCL_OK;
}; /* TkDND_SetPointerCursorObjCmd */

void TkDND_AddStateInformation(Tcl_Interp *interp, Tcl_Obj *dict,
                               unsigned int state) {
  TkDND_Dict_PutInt(interp, dict, "state",   state);
  /* Masks... */
  TkDND_Dict_PutInt(interp, dict, "1",       state & Button1Mask ? 1 : 0);
  TkDND_Dict_PutInt(interp, dict, "2",       state & Button2Mask ? 1 : 0);
  TkDND_Dict_PutInt(interp, dict, "3",       state & Button3Mask ? 1 : 0);
  TkDND_Dict_PutInt(interp, dict, "4",       state & Button4Mask ? 1 : 0);
  TkDND_Dict_PutInt(interp, dict, "5",       state & Button5Mask ? 1 : 0);
  TkDND_Dict_PutInt(interp, dict, "Mod1",    state & Mod1Mask    ? 1 : 0);
  TkDND_Dict_PutInt(interp, dict, "Mod2",    state & Mod2Mask    ? 1 : 0);
  TkDND_Dict_PutInt(interp, dict, "Mod3",    state & Mod3Mask    ? 1 : 0);
  TkDND_Dict_PutInt(interp, dict, "Mod4",    state & Mod4Mask    ? 1 : 0);
  TkDND_Dict_PutInt(interp, dict, "Mod5",    state & Mod5Mask    ? 1 : 0);
  TkDND_Dict_PutInt(interp, dict, "Alt",     state & Mod1Mask    ? 1 : 0);
  TkDND_Dict_PutInt(interp, dict, "Shift",   state & ShiftMask   ? 1 : 0);
  TkDND_Dict_PutInt(interp, dict, "Lock",    state & LockMask    ? 1 : 0);
  TkDND_Dict_PutInt(interp, dict, "Control", state & ControlMask ? 1 : 0);
}; /* TkDND_AddStateInformation */

int TkDND_HandleGenericEvent(ClientData clientData, XEvent *eventPtr) {
  Tcl_Interp *interp = (Tcl_Interp *) clientData;
  Tcl_Obj *dict;
  Tcl_Obj *objv[2], *result;
  int status, i;
  KeySym sym;
  Tk_Window main_window;

  if (interp == NULL)
    return 0;
  dict = Tcl_NewDictObj();

  switch (eventPtr->type) {
    case MotionNotify:
      TkDND_Dict_Put(interp, dict,     "type",   "MotionNotify");
      TkDND_Dict_PutInt(interp, dict,  "x",       eventPtr->xmotion.x);
      TkDND_Dict_PutInt(interp, dict,  "y",       eventPtr->xmotion.y);
      TkDND_Dict_PutInt(interp, dict,  "x_root",  eventPtr->xmotion.x_root);
      TkDND_Dict_PutInt(interp, dict,  "y_root",  eventPtr->xmotion.y_root);
      TkDND_Dict_PutLong(interp, dict, "time",    eventPtr->xmotion.time);
      TkDND_AddStateInformation(interp, dict,     eventPtr->xmotion.state);
      break;
    case ButtonPress:
      TkDND_Dict_Put(interp, dict,     "type",   "ButtonPress");
      TkDND_Dict_PutInt(interp, dict,  "x",       eventPtr->xbutton.x);
      TkDND_Dict_PutInt(interp, dict,  "y",       eventPtr->xbutton.y);
      TkDND_Dict_PutInt(interp, dict,  "x_root",  eventPtr->xbutton.x_root);
      TkDND_Dict_PutInt(interp, dict,  "y_root",  eventPtr->xbutton.y_root);
      TkDND_Dict_PutLong(interp, dict, "time",    eventPtr->xbutton.time);
      TkDND_AddStateInformation(interp, dict,     eventPtr->xbutton.state);
      TkDND_Dict_PutInt(interp, dict,  "button",  eventPtr->xbutton.button);
      break;
    case ButtonRelease:
      TkDND_Dict_Put(interp, dict,     "type",   "ButtonRelease");
      TkDND_Dict_PutInt(interp, dict,  "x",       eventPtr->xbutton.x);
      TkDND_Dict_PutInt(interp, dict,  "y",       eventPtr->xbutton.y);
      TkDND_Dict_PutInt(interp, dict,  "x_root",  eventPtr->xbutton.x_root);
      TkDND_Dict_PutInt(interp, dict,  "y_root",  eventPtr->xbutton.y_root);
      TkDND_Dict_PutLong(interp, dict, "time",    eventPtr->xbutton.time);
      TkDND_AddStateInformation(interp, dict,     eventPtr->xbutton.state);
      TkDND_Dict_PutInt(interp, dict,  "button",  eventPtr->xbutton.button);
      break;
    case KeyPress:
      TkDND_Dict_Put(interp, dict,     "type",   "KeyPress");
      TkDND_Dict_PutInt(interp, dict,  "x",       eventPtr->xkey.x);
      TkDND_Dict_PutInt(interp, dict,  "y",       eventPtr->xkey.y);
      TkDND_Dict_PutInt(interp, dict,  "x_root",  eventPtr->xkey.x_root);
      TkDND_Dict_PutInt(interp, dict,  "y_root",  eventPtr->xkey.y_root);
      TkDND_Dict_PutLong(interp, dict, "time",    eventPtr->xkey.time);
      TkDND_AddStateInformation(interp, dict,     eventPtr->xkey.state);
      TkDND_Dict_PutInt(interp, dict,  "keycode", eventPtr->xkey.keycode);
      main_window = Tk_MainWindow(interp);
      sym = XKeycodeToKeysym(Tk_Display(main_window),
                             eventPtr->xkey.keycode, 0);
      TkDND_Dict_Put(interp, dict,     "keysym",   XKeysymToString(sym));
      break;
    case KeyRelease:
      TkDND_Dict_Put(interp, dict,     "type",   "KeyRelease");
      TkDND_Dict_PutInt(interp, dict,  "x",       eventPtr->xkey.x);
      TkDND_Dict_PutInt(interp, dict,  "y",       eventPtr->xkey.y);
      TkDND_Dict_PutInt(interp, dict,  "x_root",  eventPtr->xkey.x_root);
      TkDND_Dict_PutInt(interp, dict,  "y_root",  eventPtr->xkey.y_root);
      TkDND_Dict_PutLong(interp, dict, "time",    eventPtr->xkey.time);
      TkDND_AddStateInformation(interp, dict,     eventPtr->xkey.state);
      TkDND_Dict_PutInt(interp, dict,  "keycode", eventPtr->xkey.keycode);
      main_window = Tk_MainWindow(interp);
      sym = XKeycodeToKeysym(Tk_Display(main_window),
                             eventPtr->xkey.keycode, 0);
      TkDND_Dict_Put(interp, dict,     "keysym",   XKeysymToString(sym));
      break;
    case EnterNotify:
      return 0;
      TkDND_Dict_Put(interp, dict, "type", "EnterNotify");
      TkDND_Dict_PutLong(interp, dict, "time", eventPtr->xcrossing.time);
      break;
    case LeaveNotify:
      return 0;
      TkDND_Dict_Put(interp, dict, "type", "LeaveNotify");
      TkDND_Dict_PutLong(interp, dict, "time", eventPtr->xcrossing.time);
      break;
    case SelectionRequest:
      main_window = Tk_MainWindow(interp);
      TkDND_Dict_Put(interp, dict, "type", "SelectionRequest");
      TkDND_Dict_PutLong(interp, dict, "time",     eventPtr->xselectionrequest.time);
      TkDND_Dict_PutLong(interp, dict, "owner",    eventPtr->xselectionrequest.owner);
      TkDND_Dict_PutLong(interp, dict, "requestor", eventPtr->xselectionrequest.requestor);
      TkDND_Dict_Put(interp, dict,     "selection",
            Tk_GetAtomName(main_window, eventPtr->xselectionrequest.selection));
      TkDND_Dict_Put(interp, dict,     "target",
            Tk_GetAtomName(main_window, eventPtr->xselectionrequest.target));
      TkDND_Dict_Put(interp, dict,     "property",
            Tk_GetAtomName(main_window, eventPtr->xselectionrequest.property));
      break;
    default:
      Tcl_DecrRefCount(dict);
      return 0;
  }
  /* Call out Tcl callback. */
  objv[0] = Tcl_NewStringObj("tkdnd::xdnd::_process_drag_events", -1);
  objv[1] = dict;
  status = TkDND_Eval(interp, 2, objv);
  if (status == TCL_OK) {
    result = Tcl_GetObjResult(interp); Tcl_IncrRefCount(result);
    status = Tcl_GetIntFromObj(interp, result, &i);
    Tcl_DecrRefCount(result);
    if (status == TCL_OK)
      return i;
  } else {
    /* An error occured, stop the drag action... */
    Tcl_SetVar(interp, "::tkdnd::xdnd::_dragging", "0", TCL_GLOBAL_ONLY);
  }
  return 0;
}; /* TkDND_HandleGenericEvent */

int TkDND_RegisterGenericEventHandlerObjCmd(ClientData clientData,
                         Tcl_Interp *interp, int objc, Tcl_Obj *CONST objv[]) {
  if (objc != 1) {
    Tcl_WrongNumArgs(interp, 1, objv, "");
    return TCL_ERROR;
  }
  Tk_CreateGenericHandler(TkDND_HandleGenericEvent, interp);
  return TCL_OK;
}; /* TkDND_RegisterGenericEventHandlerObjCmd */

int TkDND_UnregisterGenericEventHandlerObjCmd(ClientData clientData,
                         Tcl_Interp *interp, int objc, Tcl_Obj *CONST objv[]) {
  if (objc != 1) {
    Tcl_WrongNumArgs(interp, 1, objv, "");
    return TCL_ERROR;
  }
  Tk_DeleteGenericHandler(TkDND_HandleGenericEvent, interp);
  return TCL_OK;
}; /* TkDND_UnegisterGenericEventHandlerObjCmd */

int TkDND_AnnounceTypeListObjCmd(ClientData clientData, Tcl_Interp *interp,
                            int objc, Tcl_Obj *CONST objv[]) {
  Tk_Window path;
  Tcl_Obj **type;
  int status, i, types;
  Atom *typelist;

  if (objc != 3) {
    Tcl_WrongNumArgs(interp, 1, objv, "path types-list");
    return TCL_ERROR;
  }
  path = TkDND_TkWin(objv[1]);
  if (!path)
    return TCL_ERROR;
  status = Tcl_ListObjGetElements(interp, objv[2], &types, &type);
  if (status != TCL_OK)
    return status;
  typelist = (Atom *) Tcl_Alloc(types * sizeof(Atom));
  if (typelist == NULL)
    return TCL_ERROR;
  for (i = 0; i < types; ++i) {
    typelist[i] = Tk_InternAtom(path, Tcl_GetString(type[i]));
  }
  XChangeProperty(Tk_Display(path), Tk_WindowId(path),
                  Tk_InternAtom(path, "XdndTypeList"),
                  XA_ATOM, 32, PropModeReplace,
                  (unsigned char*) typelist, types);
  Tcl_Free((char *) typelist);
  return TCL_OK;
}; /* TkDND_AnnounceTypeListObjCmd */

int TkDND_AnnounceActionListObjCmd(ClientData clientData, Tcl_Interp *interp,
                            int objc, Tcl_Obj *CONST objv[]) {
  Tk_Window path;
  Tcl_Obj **action, **description;
  int status, i, actions, descriptions;
  Atom actionlist[10], descriptionlist[10];

  if (objc != 4) {
    Tcl_WrongNumArgs(interp, 1, objv, "path actions-list descriptions-list");
    return TCL_ERROR;
  }
  path = TkDND_TkWin(objv[1]);
  if (!path)
    return TCL_ERROR;
  status = Tcl_ListObjGetElements(interp, objv[2], &actions, &action);
  if (status != TCL_OK)
    return status;
  status = Tcl_ListObjGetElements(interp, objv[3], &descriptions, &description);
  if (status != TCL_OK)
    return status;

  if (actions != descriptions) {
    Tcl_SetResult(interp, "number of actions != number of descriptions", TCL_STATIC);
    return TCL_ERROR;
  }
  if (actions > 10) {
    Tcl_SetResult(interp, "too many actions/descriptions", TCL_STATIC);
    return TCL_ERROR;
  }

  for (i = 0; i < actions; ++i) {
    actionlist[i]      = Tk_InternAtom(path, Tcl_GetString(action[i]));
    descriptionlist[i] = Tk_InternAtom(path, Tcl_GetString(description[i]));
  }
  XChangeProperty(Tk_Display(path), Tk_WindowId(path),
                  Tk_InternAtom(path, "XdndActionList"),
                  XA_ATOM, 32, PropModeReplace,
                  (unsigned char*) actionlist, actions);
  XChangeProperty(Tk_Display(path), Tk_WindowId(path),
                  Tk_InternAtom(path, "XdndActionDescription"),
                  XA_ATOM, 32, PropModeReplace,
                  (unsigned char*) descriptionlist, descriptions);
  return TCL_OK;
}; /* TkDND_AnnounceActionListObjCmd */

int TkDND_FindDropTargetWindowObjCmd(ClientData clientData,
                         Tcl_Interp *interp, int objc, Tcl_Obj *CONST objv[]) {
  int rootx, rooty;
  Tk_Window path;
  Window root, src, t;
  Window target = 0;
  int lx = 0, ly = 0, lx2, ly2;
  Display *display;
  Atom XdndAware;
  Atom type = 0;
  int f;
  unsigned long n, a;
  unsigned char *data = 0;

  if (objc != 4) {
    Tcl_WrongNumArgs(interp, 1, objv, "path rootx rooty");
    return TCL_ERROR;
  }
  path = TkDND_TkWin(objv[1]);
  if (!path)
    return TCL_ERROR;
  if (Tcl_GetIntFromObj(interp, objv[2], &rootx) != TCL_OK)
    return TCL_ERROR;
  if (Tcl_GetIntFromObj(interp, objv[3], &rooty) != TCL_OK)
    return TCL_ERROR;
  root = RootWindowOfScreen(Tk_Screen(path));
  display = Tk_Display(path);

  if (!XTranslateCoordinates(display, root, root, rootx, rooty, &lx, &ly, &target))
    return TCL_ERROR;
  if (target == root)
    return TCL_ERROR;
  src = root;
  XdndAware = Tk_InternAtom(path, "XdndAware");
  while (target != 0) {
    if (!XTranslateCoordinates(display, src, target, lx, ly, &lx2, &ly2, &t)) {
      target = 0; break; /* Error... */
    }
    lx = lx2; ly = ly2; src = target; type = 0; data = NULL;
    /* Check if we can find the XdndAware property... */
    XGetWindowProperty(display, target, XdndAware, 0, 0, False,
                       AnyPropertyType, &type, &f,&n,&a,&data);
    if (data) XFree(data);
    if (type) break; /* We have found a target! */
    /* Find child at the coordinates... */
    if (!XTranslateCoordinates(display, src, src, lx, ly, &lx2, &ly2, &target)){
      target = 0; break; /* Error */
    }
  }
  if (target) {
    Tcl_SetObjResult(interp, Tcl_NewLongObj(target));
  } else {
    Tcl_ResetResult(interp);
  }

  return TCL_OK;
}; /* TkDND_FindDropTargetWindowObjCmd */

int TkDND_FindDropTargetProxyObjCmd(ClientData clientData,
                         Tcl_Interp *interp, int objc, Tcl_Obj *CONST objv[]) {
  Window target, proxy, *proxy_ptr;
  Atom type = None;
  int f;
  unsigned long n, a;
  unsigned char *retval = NULL;
  Display *display;
  Tk_Window path;

  if (objc != 3) {
    Tcl_WrongNumArgs(interp, 1, objv, "source target");
    return TCL_ERROR;
  }

  path = TkDND_TkWin(objv[1]);
  if (!path)
    return TCL_ERROR;
  if (Tcl_GetLongFromObj(interp, objv[2], (long *) &target) != TCL_OK) {
    return TCL_ERROR;
  }
  display = Tk_Display(path);
  proxy = target;
  XGetWindowProperty(display, target, Tk_InternAtom(path, "XdndProxy"), 0, 1,
                     False, XA_WINDOW, &type, &f,&n,&a,&retval);
  proxy_ptr = (Window *) retval;
  if (type == XA_WINDOW && proxy_ptr) {
    proxy = *proxy_ptr;
    XFree(proxy_ptr);
    proxy_ptr = NULL;
    /* Is the XdndProxy property pointing to the same window? */
    XGetWindowProperty(display, proxy, Tk_InternAtom(path, "XdndProxy"), 0, 1,
                       False, XA_WINDOW, &type, &f,&n,&a,&retval);
    proxy_ptr = (Window *) retval;
    if (type != XA_WINDOW || !proxy_ptr || *proxy_ptr != proxy) {
      proxy = target;
    }
  }
  if (proxy_ptr) XFree(proxy_ptr);
  Tcl_SetObjResult(interp, Tcl_NewLongObj(proxy));

  return TCL_OK;
}; /* TkDND_FindDropTargetProxyObjCmd */

int TkDND_SendXdndEnterObjCmd(ClientData clientData,
                         Tcl_Interp *interp, int objc, Tcl_Obj *CONST objv[]) {
  XEvent event;
  Tk_Window source;
  Window target, proxy;
  Display *display;
  int types, r, f, *tv, target_version = XDND_VERSION, flags, status, i;
  Atom t = None;
  unsigned long n, a;
  unsigned char *retval;
  Tcl_Obj **type;

  if (objc != 5) {
    Tcl_WrongNumArgs(interp, 1, objv, "source target proxy types_len");
    return TCL_ERROR;
  }

  source = TkDND_TkWin(objv[1]);
  if (!source)
    return TCL_ERROR;
  if (Tcl_GetLongFromObj(interp, objv[2], (long *) &target) != TCL_OK) {
    return TCL_ERROR;
  }
  if (Tcl_GetLongFromObj(interp, objv[3], (long *) &proxy) != TCL_OK) {
    return TCL_ERROR;
  }
  status = Tcl_ListObjGetElements(interp, objv[4], &types, &type);
  if (status != TCL_OK)
    return status;
  display = Tk_Display(source);

  /* Get the XDND version supported by the target... */
  r = XGetWindowProperty(display, proxy, Tk_InternAtom(source, "XdndAware"), 0, 1,
                         False, AnyPropertyType, &t, &f,&n,&a,&retval);
  if (r != Success) {
    Tcl_SetResult(interp, "cannot retrieve XDND version from target",
                  TCL_STATIC);
    return TCL_ERROR;
  }
  tv = (int *)retval;
  if (tv) {
    if (*tv < target_version) target_version = *tv;
    XFree(tv);
  }

  memset (&event, 0, sizeof(event));
  event.type                    = ClientMessage;
  event.xclient.window          = target;
  event.xclient.format          = 32;
  event.xclient.message_type    = Tk_InternAtom(source, "XdndEnter");
  event.xclient.data.l[0]       = Tk_WindowId(source);
  flags = target_version << 24;
  if (types > 3) flags |= 0x0001;
  event.xclient.data.l[1] = flags;
  for (i = 0; i < types && i < 3; ++i) {
    event.xclient.data.l[2+i] = Tk_InternAtom(source, Tcl_GetString(type[i]));
  }
  XSendEvent(display, proxy, False, NoEventMask, &event);

  return TCL_OK;
}; /* TkDND_SendXdndEnterObjCmd */

int TkDND_SendXdndPositionObjCmd(ClientData clientData,
                         Tcl_Interp *interp, int objc, Tcl_Obj *CONST objv[]) {
  static char *DropActions[] = {
    "copy", "move", "link", "ask",  "private", "default",
    (char *) NULL
  };
  enum dropactions {
    ActionCopy, ActionMove, ActionLink, ActionAsk, ActionPrivate, ActionDefault
  };

  XEvent event;
  Tk_Window source;
  Window target, proxy;
  Display *display;
  int rootx, rooty, status, index;

  if (objc != 7) {
    Tcl_WrongNumArgs(interp, 1, objv, "source target proxy rootx rooty action");
    return TCL_ERROR;
  }

  source = TkDND_TkWin(objv[1]);
  if (!source)
    return TCL_ERROR;
  if (Tcl_GetLongFromObj(interp, objv[2], (long *) &target) != TCL_OK) {
    return TCL_ERROR;
  }
  if (Tcl_GetLongFromObj(interp, objv[3], (long *) &proxy) != TCL_OK) {
    return TCL_ERROR;
  }
  if (Tcl_GetIntFromObj(interp, objv[4], &rootx) != TCL_OK)
    return TCL_ERROR;
  if (Tcl_GetIntFromObj(interp, objv[5], &rooty) != TCL_OK)
    return TCL_ERROR;
  status = Tcl_GetIndexFromObj(interp, objv[6], (const char **) DropActions,
                            "dropactions", 0, &index);
  if (status != TCL_OK)
    return status;
  display = Tk_Display(source);

  memset (&event, 0, sizeof(event));
  event.type                       = ClientMessage;
  event.xclient.window             = target;
  event.xclient.format             = 32;
  event.xclient.message_type       = Tk_InternAtom(source, "XdndPosition");
  event.xclient.data.l[0]          = Tk_WindowId(source);
  event.xclient.data.l[1]          = 0; // flags
  event.xclient.data.l[2]          = (rootx << 16) + rooty;
  event.xclient.data.l[3]          = CurrentTime;
  switch ((enum dropactions) index) {
    case ActionDefault:
    case ActionCopy:
      event.xclient.data.l[4] = Tk_InternAtom(source, "XdndActionCopy");    break;
    case ActionMove:
      event.xclient.data.l[4] = Tk_InternAtom(source, "XdndActionMove");    break;
    case ActionLink:
      event.xclient.data.l[4] = Tk_InternAtom(source, "XdndActionLink");    break;
    case ActionAsk:
      event.xclient.data.l[4] = Tk_InternAtom(source, "XdndActionAsk");     break;
    case ActionPrivate:
      event.xclient.data.l[4] = Tk_InternAtom(source, "XdndActionPrivate"); break;
  }

  XSendEvent(display, proxy, False, NoEventMask, &event);

  return TCL_OK;
}; /* TkDND_SendXdndPositionObjCmd */

int TkDND_SendXdndLeaveObjCmd(ClientData clientData,
                         Tcl_Interp *interp, int objc, Tcl_Obj *CONST objv[]) {
  XEvent event;
  Tk_Window source;
  Window target, proxy;

  if (objc != 4) {
    Tcl_WrongNumArgs(interp, 1, objv, "source target proxy");
    return TCL_ERROR;
  }

  source = TkDND_TkWin(objv[1]);
  if (!source)
    return TCL_ERROR;
  if (Tcl_GetLongFromObj(interp, objv[2], (long *) &target) != TCL_OK) {
    return TCL_ERROR;
  }
  if (Tcl_GetLongFromObj(interp, objv[3], (long *) &proxy) != TCL_OK) {
    return TCL_ERROR;
  }

  memset (&event, 0, sizeof(event));
  event.type                       = ClientMessage;
  event.xclient.window             = target;
  event.xclient.format             = 32;
  event.xclient.message_type       = Tk_InternAtom(source, "XdndLeave");
  event.xclient.data.l[0]          = Tk_WindowId(source);
  XSendEvent(Tk_Display(source), proxy, False, NoEventMask, &event);
  return TCL_OK;
}; /* TkDND_SendXdndLeaveObjCmd */

int TkDND_SendXdndDropObjCmd(ClientData clientData,
                         Tcl_Interp *interp, int objc, Tcl_Obj *CONST objv[]) {
  XEvent event;
  Tk_Window source;
  Window target, proxy;

  if (objc != 4) {
    Tcl_WrongNumArgs(interp, 1, objv, "source target proxy");
    return TCL_ERROR;
  }

  source = TkDND_TkWin(objv[1]);
  if (!source)
    return TCL_ERROR;
  if (Tcl_GetLongFromObj(interp, objv[2], (long *) &target) != TCL_OK)
    return TCL_ERROR;
  if (Tcl_GetLongFromObj(interp, objv[3], (long *) &proxy) != TCL_OK)
    return TCL_ERROR;

  memset (&event, 0, sizeof(event));
  event.type                       = ClientMessage;
  event.xclient.window             = target;
  event.xclient.format             = 32;
  event.xclient.message_type       = Tk_InternAtom(source, "XdndDrop");
  event.xclient.data.l[0]          = Tk_WindowId(source);
  event.xclient.data.l[2]          = CurrentTime;
  XSendEvent(Tk_Display(source), proxy, False, NoEventMask, &event);
  Tcl_SetObjResult(interp, Tcl_NewLongObj(event.xclient.data.l[2]));
  return TCL_OK;
}; /* TkDND_SendXdndDropObjCmd */

int TkDND_XChangePropertyObjCmd(ClientData clientData,
                         Tcl_Interp *interp, int objc, Tcl_Obj *CONST objv[]) {
  XEvent event;
  Window target;
  Atom property = None, type = None;
  int format, numItems, numFields, i;
  Display *display;
  Tk_Window source;
  Time time;
  unsigned char *data = NULL;
  Tcl_Obj **field;

  if (objc != 9) {
    Tcl_WrongNumArgs(interp, 1, objv, "source requestor property type format time data data_items");
    return TCL_ERROR;
  }

  source = TkDND_TkWin(objv[1]);
  if (!source)
    return TCL_ERROR;
  if (Tcl_GetLongFromObj(interp, objv[2], (long *) &target) != TCL_OK) {
    return TCL_ERROR;
  }
  display  = Tk_Display(source);
  property = Tk_InternAtom(source, Tcl_GetString(objv[3]));
  type     = Tk_InternAtom(source, Tcl_GetString(objv[4]));
  if (Tcl_GetIntFromObj(interp, objv[5], &format) != TCL_OK) {
    return TCL_ERROR;
  }
  if (format != 8 && format != 16 && format != 32) {
    Tcl_SetResult(interp, "unsupported format: not 8, 16 or 32", TCL_STATIC);
    return TCL_ERROR;
  }
  if (Tcl_GetIntFromObj(interp, objv[5], &format) != TCL_OK) {
    return TCL_ERROR;
  }
  if (Tcl_GetLongFromObj(interp, objv[6], (long *) &time) != TCL_OK) {
    return TCL_ERROR;
  }
  if (Tcl_GetIntFromObj(interp, objv[8], &numItems) != TCL_OK) {
    return TCL_ERROR;
  }
  if (!time)
    time = CurrentTime;
  switch (format) {
    case 8:
      data = (unsigned char *) Tcl_GetString(objv[7]);
      break;
    case 16: {
      short *propPtr = (short *) Tcl_Alloc(sizeof(short)*numItems);
      data = (unsigned char *) propPtr;
      if (Tcl_ListObjGetElements(interp, objv[7], &numFields, &field) != TCL_OK) {
        return TCL_ERROR;
      }
      for (i = 0; i < numItems; i++) {
        char *dummy;
        propPtr[i] = (short) strtol(Tcl_GetString(field[i]), &dummy, 0);
      }
      break;
    }
    case 32: {
      long *propPtr  = (long *) Tcl_Alloc(sizeof(long)*numItems);
      data = (unsigned char *) propPtr;
      if (Tcl_ListObjGetElements(interp, objv[7], &numFields, &field) != TCL_OK) {
        return TCL_ERROR;
      }
      for (i = 0; i < numItems; i++) {
        char *dummy;
        propPtr[i] = (short) strtol(Tcl_GetString(field[i]), &dummy, 0);
      }
      break;
    }
  }
  XChangeProperty(display, target, property, type, format, PropModeReplace, (unsigned char *) data, numItems);
  if (format > 8 && data)
    Tcl_Free((char *) data);
  /* Send selection notify to requestor... */
  event.xselection.type      = SelectionNotify;
  event.xselection.display   = display;
  event.xselection.requestor = target;
  event.xselection.selection = Tk_InternAtom(source, "XdndSelection");
  event.xselection.target    = type;
  event.xselection.property  = property;
  event.xselection.time      = time;
  XSendEvent(display, target, False, NoEventMask, &event);
  return TCL_OK;
}; /* TkDND_XChangePropertyObjCmd */

/*
 * For C++ compilers, use extern "C"
 */
#ifdef __cplusplus
extern "C" {
#endif
int Tkdnd_Init(Tcl_Interp *interp);
int Tkdnd_SafeInit(Tcl_Interp *interp);
#ifdef __cplusplus
}
#endif

int Tkdnd_Init(Tcl_Interp *interp) {
  int major, minor, patchlevel;

  if (
#ifdef USE_TCL_STUBS
      Tcl_InitStubs(interp, "8.3", 0)
#else
      Tcl_PkgRequire(interp, "Tcl", "8.3", 0)
#endif /* USE_TCL_STUBS */
            == NULL) {
            return TCL_ERROR;
  }
  if (
#ifdef USE_TK_STUBS
       Tk_InitStubs(interp, "8.3", 0)
#else
       Tcl_PkgRequire(interp, "Tk", "8.3", 0)
#endif /* USE_TK_STUBS */
            == NULL) {
            return TCL_ERROR;
  }

  /*
   * Get the version, because we really need 8.3.3+.
   */
  Tcl_GetVersion(&major, &minor, &patchlevel, NULL);
  if ((major == 8) && (minor == 3) && (patchlevel < 3)) {
    Tcl_SetResult(interp, "tkdnd requires Tk 8.3.3 or greater", TCL_STATIC);
    return TCL_ERROR;
  }


  /* Register the various commands */
  if (Tcl_CreateObjCommand(interp, "::tkdnd::_register_types",
           (Tcl_ObjCmdProc*) TkDND_RegisterTypesObjCmd,
           (ClientData) NULL, (Tcl_CmdDeleteProc *) NULL) == NULL) {
    return TCL_ERROR;
  }

#if 0
  if (Tcl_CreateObjCommand(interp, "::tkdnd::_get_selection",
           (Tcl_ObjCmdProc*) TkDND_GetSelectionObjCmd,
           (ClientData) NULL, (Tcl_CmdDeleteProc *) NULL) == NULL) {
    return TCL_ERROR;
  }

  if (Tcl_CreateObjCommand(interp, "_grab_pointer",
           (Tcl_ObjCmdProc*) TkDND_GrabPointerObjCmd,
           (ClientData) NULL, (Tcl_CmdDeleteProc *) NULL) == NULL) {
    return TCL_ERROR;
  }

  if (Tcl_CreateObjCommand(interp, "_ungrab_pointer",
           (Tcl_ObjCmdProc*) TkDND_UnrabPointerObjCmd,
           (ClientData) NULL, (Tcl_CmdDeleteProc *) NULL) == NULL) {
    return TCL_ERROR;
  }
#endif

  if (Tcl_CreateObjCommand(interp, "_set_pointer_cursor",
           (Tcl_ObjCmdProc*) TkDND_SetPointerCursorObjCmd,
           (ClientData) NULL, (Tcl_CmdDeleteProc *) NULL) == NULL) {
    return TCL_ERROR;
  }

  if (Tcl_CreateObjCommand(interp, "_register_generic_event_handler",
           (Tcl_ObjCmdProc*) TkDND_RegisterGenericEventHandlerObjCmd,
           (ClientData) NULL, (Tcl_CmdDeleteProc *) NULL) == NULL) {
    return TCL_ERROR;
  }

  if (Tcl_CreateObjCommand(interp, "_unregister_generic_event_handler",
           (Tcl_ObjCmdProc*) TkDND_UnregisterGenericEventHandlerObjCmd,
           (ClientData) NULL, (Tcl_CmdDeleteProc *) NULL) == NULL) {
    return TCL_ERROR;
  }

  if (Tcl_CreateObjCommand(interp, "_announce_type_list",
           (Tcl_ObjCmdProc*) TkDND_AnnounceTypeListObjCmd,
           (ClientData) NULL, (Tcl_CmdDeleteProc *) NULL) == NULL) {
    return TCL_ERROR;
  }

  if (Tcl_CreateObjCommand(interp, "_announce_action_list",
           (Tcl_ObjCmdProc*) TkDND_AnnounceActionListObjCmd,
           (ClientData) NULL, (Tcl_CmdDeleteProc *) NULL) == NULL) {
    return TCL_ERROR;
  }

  if (Tcl_CreateObjCommand(interp, "_find_drop_target_window",
           (Tcl_ObjCmdProc*) TkDND_FindDropTargetWindowObjCmd,
           (ClientData) NULL, (Tcl_CmdDeleteProc *) NULL) == NULL) {
    return TCL_ERROR;
  }

  if (Tcl_CreateObjCommand(interp, "_find_drop_target_proxy",
           (Tcl_ObjCmdProc*) TkDND_FindDropTargetProxyObjCmd,
           (ClientData) NULL, (Tcl_CmdDeleteProc *) NULL) == NULL) {
    return TCL_ERROR;
  }

  if (Tcl_CreateObjCommand(interp, "_send_XdndEnter",
           (Tcl_ObjCmdProc*) TkDND_SendXdndEnterObjCmd,
           (ClientData) NULL, (Tcl_CmdDeleteProc *) NULL) == NULL) {
    return TCL_ERROR;
  }

  if (Tcl_CreateObjCommand(interp, "_send_XdndPosition",
           (Tcl_ObjCmdProc*) TkDND_SendXdndPositionObjCmd,
           (ClientData) NULL, (Tcl_CmdDeleteProc *) NULL) == NULL) {
    return TCL_ERROR;
  }

  if (Tcl_CreateObjCommand(interp, "_send_XdndLeave",
           (Tcl_ObjCmdProc*) TkDND_SendXdndLeaveObjCmd,
           (ClientData) NULL, (Tcl_CmdDeleteProc *) NULL) == NULL) {
    return TCL_ERROR;
  }

  if (Tcl_CreateObjCommand(interp, "_send_XdndDrop",
           (Tcl_ObjCmdProc*) TkDND_SendXdndDropObjCmd,
           (ClientData) NULL, (Tcl_CmdDeleteProc *) NULL) == NULL) {
    return TCL_ERROR;
  }

  if (Tcl_CreateObjCommand(interp, "XChangeProperty",
           (Tcl_ObjCmdProc*) TkDND_XChangePropertyObjCmd,
           (ClientData) NULL, (Tcl_CmdDeleteProc *) NULL) == NULL) {
    return TCL_ERROR;
  }

  /* Finally, register the XDND Handler... */
  Tk_CreateClientMessageHandler(&TkDND_XDNDHandler);

  TkDND_InitialiseCursors(interp);
  Tcl_PkgProvide(interp, PACKAGE_NAME, PACKAGE_VERSION);
  return TCL_OK;
} /* Tkdnd_Init */

int Tkdnd_SafeInit(Tcl_Interp *interp) {
  return Tkdnd_Init(interp);
} /* Tkdnd_SafeInit */

/* vi:set ts=2 sw=2 et: */
