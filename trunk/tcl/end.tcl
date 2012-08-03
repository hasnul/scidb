# ======================================================================
# Author : $Author$
# Version: $Revision$
# Date   : $Date$
# Url    : $URL$
# ======================================================================

# ======================================================================
#    _/|            __
#   // o\         /    )           ,        /    /
#   || ._)    ----\---------__----------__-/----/__-
#   //__\          \      /   '  /    /   /    /   )
#   )___(     _(____/____(___ __/____(___/____(___/_
# ======================================================================

# ======================================================================
# Copyright: (C) 2009-2012 Gregor Cramer
# ======================================================================

# ======================================================================
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
# ======================================================================

::util::source initialization

# --- Special popups for BETA version only -----------------------------

namespace eval beta {

variable Welcome	0
variable WhatsNew	0

#array set NotYetImplemented {}


proc welcomeToScidb {parent} {
	variable Welcome
	variable WhatsNew

	if {!$Welcome} {
		::help::open .application Welcome
		set Welcome 1
	} elseif {$WhatsNew} {
		::help::open .application Whats-New
	}
}


proc notYetImplemented {parent what} {
#	variable NotYetImplemented

#	if {[info exists NotYetImplemented($what)]} { return }

	set hdr(de) [Enc "Noch nicht implementiert."]
	set hdr(en) [Enc "Not yet implemented."]
	set hdr(es) [Enc "Aún no implementado."]
	set hdr(it) [Enc "Non ancora implementato."]

	set msg(de) [Enc "Diese Funktionalität ist noch nicht implementiert worden, sie dient nur zur Voransicht."]
	set msg(en) [Enc "This functionality is not yet implemented. This is only a preview."]
	set msg(es) [Enc "Esta función aún no fue implementada. Esta es sólo una muestra preliminar."]
	set msg(it) [Enc "Questa funzione non è ancora implementata. Questa è solo un'anteprima."]

	::dialog::info -message $hdr($::mc::langID) -detail $msg($::mc::langID) -parent $parent
#	set NotYetImplemented($what) 1
}


proc Enc {s} { return [encoding convertfrom utf-8 $s] }


proc WriteOptions {chan} {
	::options::writeItem $chan [namespace current]::Welcome
#	::options::writeItem $chan [namespace current]::NotYetImplemented
}

::options::hookWriter [namespace current]::WriteOptions

} ;# namespace beta

# --- Initalization ----------------------------------------------------

if {[tk windowingsystem] eq "x11"} {
	namespace eval x11 {
		proc noWindowDecor {w} {
			update idletasks
			::scidb::tk::wm noDecor $w
		}
	}

	proc dialog::choosecolor::x11NoWindowDecor {w} { ::x11::noWindowDecor $w }
	proc toolbar::x11NoWindowDecor {w} { ::x11::noWindowDecor $w }
	proc fsbox::x11NoWindowDecor {w} { ::x11::noWindowDecor $w }
	proc tooltip::x11DropShadow {args} { ::x11::dropShadow {*}$args }
}

set dialog::iconOk		$icon::iconOk
set dialog::iconCancel	$icon::iconCancel
set dialog::iconGoNext	$icon::iconGoNext
set dialog::iconYes		$icon::iconOk

set dialog::choosefont::iconOk		$icon::iconOk
set dialog::choosefont::iconCancel	$icon::iconCancel
set dialog::choosefont::iconApply	$icon::iconApply
set dialog::choosefont::iconReset	$icon::iconReset

set tk::ShadowOffset $::shadow::offset

proc dialog::choosefont::messageBox {parent title msg buttons defaultButton} {
	return [::dialog::warning \
		-parent $parent \
		-title $title \
		-message $msg \
		-buttons $buttons \
		-default $defaultButton \
	]
}

set dialog::choosecolor::iconOk		$icon::iconOk
set dialog::choosecolor::iconCancel	$icon::iconCancel

proc dialog::choosecolor::tooltip {args} { ::tooltip::tooltip {*}$args }

proc calendar::tooltip {args} { ::tooltip::tooltip {*}$args }

proc fsbox::makeStateSpecificIcons {img} { return [::icon::makeStateSpecificIcons $img] }
proc fsbox::tooltip {args} { return [::tooltip::tooltip {*}$args] }
proc fsbox::messageBox {args} { return [::dialog::messageBox {*}$args] }
proc fsbox::makeStateSpecificIcons {args} { return [::icon::makeStateSpecificIcons {*}$args] }
proc fsbox::busy {args} { ::widget::busyCursor on }
proc fsbox::unbusy {args} { ::widget::busyCursor off }
proc fsbox::configureRadioEntry {args} { ::theme::configureRadioEntry {*}$args }

proc dialog::progressbar::busyCursor {w state} { ::widget::busyCursor $w $state }

proc colormenu::tooltip {args} { ::tooltip::tooltip {*}$args }

proc WriteOptions {chan} {
	options::writeList $chan ::dialog::choosecolor::userColorList
	options::writeItem $chan ::table::options
	options::writeItem $chan ::menu::Theme
	options::writeItem $chan ::toolbar::Options
	options::writeItem $chan ::fsbox::bookmarks::Bookmarks
	options::writeItem $chan ::fsbox::Options
	options::writeItem $chan ::scidb::revision
}
options::hookWriter [namespace current]::WriteOptions

proc archive::setModTime {file time} { ::scidb::misc::setModTime $file $time }
proc archive::setMessage {progress msg} { ::dialog::progressbar::setMessage $progress $msg }
proc archive::setMaxTick {progress n} { ::dialog::progressbar::setMaximum $progress $n }

proc archive::logError {msg detail} {
	::log::error $::mc::Archive $msg
	if {[string length $detail]} { ::log::info $::mc::Archive $detail }
}

proc archive::tick {progress n} {
	::dialog::progressbar::tick $progress $n
	update
}

proc scrolledframe::MapWindow {w} { ::scidb::misc::mapWindow $w }

log::finishLayout

# --- Read options -----------------------------------------------------

# prevent errors while parsing old config files (as long as we have a beta version)
proc dialog::fsbox::setBookmarks {args} {}

if {[file readable $::scidb::file::options]} {
	::load::source $::scidb::file::options -message $::load::mc::ReadingOptionsFile -encoding utf-8
}

switch $::scidb::revision {
	83 {
		set ::export::RecentlyUsedHistory	{}
		set ::export::RecentlyUsedTiebreaks	{}
		set ::application::database::RecentFiles {}
		set ::game::History {}
		array unset ::export::Values
		array set ::export::Values [array get ::export::Defaults]
		set ::export::Values(Type) scidb
		set ::export::Values(pgn,encoding) iso8859-1
		set ::export::Values(scid,encoding) utf-8
		set ::export::Values(scidb,encoding) utf-8
		set ::export::Values(pdf,encoding) iso8859-1
		set ::crosstable::RecentlyUsedHistory {}
		set ::crosstable::MostRecentHistory {}
	}

	96 {
		set ::crosstable::RecentlyUsedHistory {}
		set ::crosstable::MostRecentHistory {}
		array unset ::browser::Options font:bold
		array unset ::application::pgn::Options board-size
		array unset ::dialog::fsbox::Priv lastFolder
		array unset ::browser::Options font
		array unset ::browser::Options hilite
		array unset ::browser::Options background:current
		array unset ::browser::Options foreground:result
		array unset ::browser::Options foreground:empty
		array unset ::browser::Options style:*
		array unset ::browser::Options tabstop-*
		set ::export::Values(html,moves,notation) san
		set ::export::Values(pdf,moves,notation) san
		set ::export::Values(tex,moves,notation) san
	}
}

if {$::scidb::revision < [::scidb::misc::revision]} {
	::scidb::updateThemes
	set ::beta::WhatsNew 1
}
set ::scidb::revision [::scidb::misc::revision]

# --- Initalization ----------------------------------------------------

::theme::setTheme $menu::Theme
::menu::setup
::board::setupTheme
::tooltip::init
::mc::selectLang
::font::useLanguage $mc::langID
::font::setupChessFonts
::engine::setup
application::open

# vi:set ts=3 sw=3: