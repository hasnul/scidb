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
# Copyright: (C) 2010-2011 Gregor Cramer
# ======================================================================

# ======================================================================
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
# ======================================================================

package require Tk 8.5
if {[catch { package require tkpng }]} { package require Img }
package provide twm 1.0

namespace eval twm {
namespace eval mc {

set Close	"Close"
set Undock	"Undock"

} ;# namespace mc

array set Defaults {
	header:background				#4f94cd
	header:foreground				white
	header:font						TkHeadingFont
	header:fontsize				8
	header:button:background	#d7d7d7
}


proc mc {tok} { return [::tk::msgcat::mc [set $tok]] }
proc tooltip {args} {}

if {![catch {package require tooltip}]} {
	proc tooltip {args} { ::tooltip::tooltip {*}$args }
}


proc twm {parent} {
	set twm $parent.twm

	namespace eval [namespace current]::$twm {}
	variable $twm::Vars
	variable $twm::Options

	ttk::frame -class TwmToplevelFrame $twm
	$twm bind <Destroy> [namespace code { Destroy %W }]

	rename ::$twm $twm.__twm_frame__
	proc ::$w {command args} "[namespace current]::WidgetProc $w \$command {*}\$args"

	foreach side {left right top bottom} {
		set Vars(childs:$side) {}
		set Vars(graph:$side) {}
	}

	return $twm
}


proc WidgetProc {twm command args} {
	switch -- $command {
		add {
			Add $twm {*}$args
		}

		display {
			Display $twm
		}
	}

	return $twm
}


proc Add {twm tlw args} {
	variable $twm::Vars
	variable $twm::Options

	array set opts {
		-expand		none
		-height		100
		-width		100
		-minwidth	50
		-minheight	50
		-side			right
		-position	0
		-text			""
		-textVar		{}
	}

	array set opts $args

	foreach {key val} [array get Options *:$tlw] {
		set opts($key) $val
	}

	set textVar $opts(-textVar)
	if {[llength $textVar] == 0} {
		set Vars(textVar:$tlw) $opts(-text)
		set textVar [namespace current]::$twm::Vars(textVar:$tlw)
	}
	
	lappend Vars(childs:$opts(-side)) $tlw
	set Vars(childs:$opts(-side)) \
		[lsort -command [namespace code [list Compare $twm]] $Vars(childs:$opts(-side))]
	set Vars(arranged:$tlw) 0

	switch $opts(-side) {
		left - right {
			set Vars(orientation:$tlw) vert
			set Vars(resizable:$tlw) [expr {$expand eq "y" || $expand eq "both"}]
		}

		top - bottom {
			set Vars(orientation:$tlw) horz
			set Vars(resizable:$tlw) [expr {$expand eq "x" || $expand eq "both"}]
		}
	}

	foreach {key val} [array get opts] {
		set Options($key) $val
	}
}


proc Display {twm} {
	variable $twm::Vars
	variable $twm::Options

	foreach w $Vars(childs) {
		if {!$Vars(arranged:$w)} {
			set root $Vars(graph:$Options(-side:$w))
			InsertLeaf $twm $w $root [GetChild $root 0]
		}
	}
}


proc GetChild {node index} {
	return [lindex $index [lindex 3 $node]]
}


proc InsertLeaf {twm w pred curr} {
	variable $twm::Vars
	variable $twm::Options

	# graph:
	#	type in {leaf, frame, panedWindow, notebook}
	#	min position number
	#	max position number
	#	ordered list of childs

	set position $Options(-position:$w)
	lassign $curr type minPos maxPos childs

	if {$position < $minPos} {
		switch $type {
			leaf {
			}

			frame {
			}

			panedWindow {
			}

			notebook {
				set node [MakeFrame $curr $pred]
			}
		}
	} elseif {$position > $maxPos} {
	} else {
	}
}


proc Compare {twm lhs rhs} {
	variable $twm::Options
	return [expr {$Options(-position:$lhs) - $Options(-position:$rhs)}]
}


proc MakeFrame {twm textVar} {
	variable Defaults

	set top [ttk::frame $twm.top]
	set hdr [tk::frame $twm.top.header \
					-background $Defaults(header:background) \
					-borderwidth 1 \
					-relief raised \
				]

	pack $top -fill both -expand yes
	pack $hdr -side top -fill x -expand yes

	tk::button $hdr.close  -image $icon::12x12::close  -background $Defaults(header:button:background)
	tk::button $hdr.undock -image $icon::12x12::undock -background $Defaults(header:button:background)

	tooltip $hdr.close  Close
	tooltip $hdr.undock Undock

	set headerFont [list [font configure $Defaults(header:font) -family] $Defaults(header:fontsize) bold]
	tk::label $hdr.label \
		-textvar $textVar \
		-background $Defaults(header:background) \
		-foreground $Defaults(header:foreground) \
		-font $headerFont \
		;

	grid $hdr.close	-column 4 -row 0
	grid $hdr.undock	-column 2 -row 0
	grid $hdr.label	-column 0 -row 0 -padx 2

	grid columnconfigure $hdr 1 -weight 1
	grid columnconfigure $hdr {3 5} -minsize 3
}


proc Destroy {twm} {
	if {[namespace exists $twm]} {
		namespace delete $twm
	}
}


namespace eval icon {
namespace eval 12x12 {

set close [image create photo -data {
	iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAMAAABhq6zVAAAAZlBMVEUA5uYA6fQMJIsNLXkQ
	MIwbRpYcMp0ePqUgOYghR6ohTqEnU6YpRJUrV7UvTr40RqA1W7U5Yco5ZLJAUaBAYKpEb8Zy
	iLyLkL6Ml+mPr9CQp9ujt9S7zOPI1/Po/f7u/+b1/v76/9+Gv0fRAAAAAnRSTlMKFw+voHUA
	AAB3SURBVAgdBcFBCsMwDATAlVY2TiiBXgrt/x9X6D1xLFvqjODji5gw2FfevqwXTsAKa2BZ
	LiWGWsRe88Sm3Z1MTStm10iwpidNrrsndDCWptYVIqxzO8rtzU4EwcPGz2ttfcnjrHAibEJs
	n0MlQl3wBF6NNNLaC3/WxzmXRwQ+fwAAAABJRU5ErkJggg==
}]

set undock [image create photo -data {
	iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAMAAABhq6zVAAAA51BMVEUAAAASW3gccpL///8A
	AAAAAAAAAAAAAAABDhcAAAAAAxQ9PT0uLi53d3ZOTk5Tk6tFRUVCQkIQT2hVla08PDw6Ojo3
	Nzc2NjZAhJ5so7OHh4ZycnKJpqJambCLtrcYYn7FxMRHaXeBta99rbbLy8oeY32goJ9xmJSh
	oaC1tbXAwL8qc460tLS2tbS3t7ZzjZbIyMiTk5N+pLIAAAAAAAAAAAAAAAAAAACKucK/v77A
	wL/BwcDExMTKycnR0dHj4+Lp6Oft7ezt7e3u7u3u7u7v7+7w8O/w8PDx8fDy8vHz8/L09PT/
	//9MMki2AAAAN3RSTlMAAAAAAQIDBAUGChUaGygqLzAyMzY3Ojs/QkNIS0xQUVdZWVtjZnF6
	enuEiIiIiImZo9bq7PT8eQkIuQAAAAFiS0dETPdvEPMAAABySURBVAgdBcHLCsJAEEXBc3s6
	QxIJqKts/P9fEwVBokQyj7ZKoEvefa5zmRy0rB0Dnj5aGAmgHH67UgBA7hnlWGoye53dAZRN
	0sc7YzveAGQPQkN07Y/Y3BiCru/v3vBj2gBorqpTSm7Ra22lClwiogJ/VrotRDILsaYAAAAA
	SUVORK5CYII=
}]

} ;# namespace 12x12
} ;# namespace icon

} ;# namespace twm

if {0} {
	set header "Header"

	ttk::frame .f
	pack .f -fill both -expand yes

	twm::MakeFrame .f ::header

	tk::text .f.text -background white
	pack .f.text -in .f.top -side top
}

if {0} {
	tk::frame .f1 -width 200 -height 200 -background blue
	tk::frame .f2 -width 100 -height 200 -background red

	pack .f1 -expand 1 -fill both
	pack .f2 -expand 1 -fill both

	tk::button .f1.b -text "Dock/Undock" -command { Move .f1.b }
	pack .f1.b
	set parent .f1

	proc Move {w} {
		global parent

		if {[winfo toplevel $w] eq $w} {
			if {$parent eq ".f1"} { set parent .f2 } else { set parent .f1 }
			::scidb::tk::twm capture $w $parent
			pack $w
		} else {
			::scidb::tk::twm release $w
			wm geometry $w +100+100
			wm state $w normal
		}
	}
}

if {0} {
	tk::button .b -text "Move" -command Move
	pack .b
	toplevel .tl
	wm deiconify .tl

	proc Move {} {
		if {[winfo toplevel .b] eq "."} { set parent .tl } else { set parent . }
		::scidb::tk::twm release .b
		scidb::tk::twm capture .b $parent
		pack .b
	}
}

# vi:set ts=3 sw=3:
