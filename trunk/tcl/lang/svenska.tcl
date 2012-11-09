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
# Copyright: (C) 2012 Gregor Cramer
# Copyright: (C) 2012 Lars Ekman
# ======================================================================

# ======================================================================
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
# ======================================================================

# ======================================================================
# File encoding: utf-8
# ======================================================================

### global #############################################################
::mc::SortMapping		{ä ä à a á a å a æ ae ç c é e ë e í i ñ n ö o õ o ø oe ß ss ü u Ü U}
::mc::AsciiMapping	{ä a à a á a å a æ a é e ë e ç c í i ñ n ö o õ o ø o ü u ß ss Å A Ä A Ö O Ü U}
::mc::SortOrder		{A B C D E F G H I J K L M N O P Q R S T U V W X Y Z Å Ä Ö a b c d e f g h i j k l m n o p q r s t u v w x y z å ä ö}

::mc::Key(Alt)			"Alt"
::mc::Key(BS)			"\u232b"
::mc::Key(Ctrl)		"Ctrl" ;# NEW
::mc::Key(Del)			"Del" ;# NEW
::mc::Key(Down)		"\u2193"
::mc::Key(End)			"End" ;# NEW
::mc::Key(Enter)		"Enter" ;# NEW
::mc::Key(Esc)			"Esc"
::mc::Key(Home)		"Home" ;# NEW
::mc::Key(Left)		"\u2190"	;# "Vänster"
::mc::Key(Next)		"Page\u2193"	;# Page Down NEW
::mc::Key(Prior)		"Page\u2191"	;# Page Up NEW
::mc::Key(Right)		"\u2192" ;# "Höger"
::mc::Key(Shift)		"Shift" ;# NEW
::mc::Key(Up)			"\u2191"

::mc::Alignment		"Justering"
::mc::Apply				"Verkställ"
::mc::Archive			"Arkiv"
::mc::Background		"Bakgrund"
::mc::Black				"Svart"
::mc::Bottom			"Underkant"
::mc::Cancel			"Avbryt"
::mc::Clear				"Töm"
::mc::Close				"Stäng"
::mc::Color				"Färg"
::mc::Colors			"Färger"
::mc::Configuration	"Configuration" ;# NEW
::mc::Copy				"Kopiera"
::mc::Cut				"Klipp ut"
::mc::Dark				"Mörk"
::mc::Database			"Databas"
::mc::Default			"Standard"
::mc::Delete			"Radera"
::mc::Edit				"Redigera"
::mc::File				"File" ;# NEW
::mc::From				"Från"
::mc::Game				"Parti"
::mc::Layout			"Layout"
::mc::Left				"Vänster"
::mc::Lite				"Ljus"
::mc::Low				"Low" ;# NEW
::mc::Modify			"Ändra"
::mc::No					"nej"
::mc::Normal			"Normal" ;# NEW
::mc::NotAvailable	"n/a"
::mc::Number			"Nummer"
::mc::OK					"OK"
::mc::Order				"Order" ;# NEW
::mc::Paste				"Klistra in"
::mc::PieceSet			"Pjäser"
::mc::Preview			"Förhandsgranska"
::mc::Redo				"Gör om"
::mc::Remove			"Ta bort"
::mc::Reset				"Återställ"
::mc::Right				"Höger"
::mc::SelectAll		"Markera allt"
::mc::Texture			"Texture"
::mc::Theme				"Tema"
::mc::To					"Till"
::mc::Top				"Överkant"
::mc::Undo				"Undo"
::mc::Variation		"Variation"
::mc::White				"Vit"
::mc::Yes				"ja"

::mc::LogicalReset	"Återställ"
::mc::LogicalAnd		"Och"
::mc::LogicalOr		"Eller"
::mc::LogicalNot		"Icke"

::mc::King				"Kung"
::mc::Queen				"Dam"
::mc::Rook				"Torn"
::mc::Bishop			"Löpare"
::mc::Knight			"Springare"
::mc::Pawn				"Bonde"

### scidb ##############################################################
::scidb::mc::CannotOverwriteTheme	"Kan inte skriva över tema %s."

### locale #############################################################
::locale::Pattern(decimalPoint)	","
::locale::Pattern(thousandsSep)	" "
::locale::Pattern(dateY)			"Y"
::locale::Pattern(dateM)			"Y M"
::locale::Pattern(dateD)			"Y-M-D"
::locale::Pattern(time)				"den D M Y, h:m"
::locale::Pattern(normal:dateY)	"Y"
::locale::Pattern(normal:dateM)	"Y-M"
::locale::Pattern(normal:dateD)	"Y-M-D"

### widget #############################################################
::widget::mc::Apply		"&Verkställ"
::widget::mc::Cancel		"&Avbryt"
::widget::mc::Clear		"&Rensa"
::widget::mc::Close		"S&täng"
::widget::mc::Ok			"&OK"
::widget::mc::Reset		"Å&terställ"
::widget::mc::Update		"&Updatera"
::widget::mc::Import		"&Importera"
::widget::mc::Revert		"&Återgå"
::widget::mc::Previous	"&Föregående"
::widget::mc::Next		"&Nästa"
::widget::mc::First		"&Första"
::widget::mc::Last		"&Sista"
::widget::mc::Help		"&Hjälp"
::widget::mc::Start		"&Start" ;# NEW

::widget::mc::New			"&New" ;# NEW
::widget::mc::Save		"&Spara"
::widget::mc::Delete		"&Radera"

::widget::mc::Control(minimize)	"Minimera"
::widget::mc::Control(restore)	"Lämna helskärm"
::widget::mc::Control(close)		"Stäng"

### util ###############################################################

::util::mc::IOErrorOccurred					"I/O fel uppstod"

::util::mc::IOError(OpenFailed)				"öppningen misslyckades"
::util::mc::IOError(ReadOnly)					"databasen är skrivskyddad"
::util::mc::IOError(UnknownVersion)			"okänd filversion"
::util::mc::IOError(UnexpectedVersion)		"oväntad filversion"
::util::mc::IOError(Corrupted)				"skadad fil"
::util::mc::IOError(WriteFailed)				"skrivning misslyckades"
::util::mc::IOError(InvalidData)				"ogiltigt data (filen kan vara skadad)"
::util::mc::IOError(ReadError)				"läsfel"
::util::mc::IOError(EncodingFailed)			"kan inte skriva i namnbas fil"
::util::mc::IOError(MaxFileSizeExceeded)	"maximal filstorlek uppnådd"
::util::mc::IOError(LoadFailed)				"inläsningen misslyckades  (för många tävlingar)"

::util::mc::SelectionOwnerDidntRespond		"Timeout during drop action: selection owner didn't respond."

### progress ###########################################################
::progress::mc::Progress							"Förlopp"

::progress::mc::Message(preload-namebase)		"Förladdar namndatabas"
::progress::mc::Message(preload-tournament)	"Förladdar turneringsindex"
::progress::mc::Message(preload-player)		"Förladdar spelarindex"
::progress::mc::Message(preload-annotator)	"Förladdar kommentatorindex"

::progress::mc::Message(read-index)				"Laddar indexdata"
::progress::mc::Message(read-game)				"Laddar partidata"
::progress::mc::Message(read-namebase)			"Laddar namndatabas"
::progress::mc::Message(read-tournament)		"Laddar turneringsindex"
::progress::mc::Message(read-player)			"Laddar spelarindex"
::progress::mc::Message(read-annotator)		"Laddar kommentatorindex"
::progress::mc::Message(read-source)			"Laddar källindex"
::progress::mc::Message(read-team)				"Laddar lagindex"
::progress::mc::Message(read-init)				"Laddar initieringsdata"

::progress::mc::Message(write-index)			"Skriver indexdata"
::progress::mc::Message(write-game)				"Skriver partidata"
::progress::mc::Message(write-namebase)		"Skriver namndatabas"

::progress::mc::Message(print-game)				"Print %s game(s)" ;# NEW
::progress::mc::Message(copy-game)				"Copy %s game(s)" ;# NEW

### menu ###############################################################
::menu::mc::Theme							"Tema"

::menu::mc::AllScidbFiles				"Alla Scidb filer"
::menu::mc::AllScidbBases				"Alla Scidb databaser"
::menu::mc::ScidBases					"Scid databaser"
::menu::mc::ScidbBases					"Scidb databaser"
::menu::mc::ChessBaseBases				"ChessBase databaser"
::menu::mc::ScidbArchives				"Scidb arkiv"
::menu::mc::PGNFilesArchives			"PGN filer/arkiv"
::menu::mc::PGNFiles						"PGN filer"
::menu::mc::PGNArchives					"PGN arkiv"

::menu::mc::Language						"&Språk"
::menu::mc::Toolbars						"&Verktygsfält"
::menu::mc::ShowLog						"Visa &Log"
::menu::mc::AboutScidb					"&Om Scidb"
::menu::mc::Fullscreen					"&Helskärm"
::menu::mc::LeaveFullscreen			"Lämna &helskärm"
::menu::mc::Help							"&Hjälp"
::menu::mc::Contact						"&Kontakt (Webbläsare)"
::menu::mc::Quit							"&Avsluta"
::menu::mc::Extras						"&Tillägg"
::menu::mc::Setup							"Setu&p" ;# NEW
::menu::mc::Engines						"&Engines" ;# NEW

::menu::mc::ContactBugReport			"&Felrapport"
::menu::mc::ContactFeatureRequest	"Ö&nskemål"
::menu::mc::InstallChessBaseFonts	"Installera ChessBase fonter"
::menu::mc::OpenEngineLog				"Open &Engine Console" ;# NEW

::menu::mc::OpenFile						"Öppna Scidb fil"
::menu::mc::NewFile						"Skapa Scidb fil"
::menu::mc::Archiving					"Arkiverar"
::menu::mc::CreateArchive				"Skapa arkiv"
::menu::mc::BuildArchive				"Skapa arkiver %s"
::menu::mc::Data							"%s data" ;# NEW

### load ###############################################################
::load::mc::SevereError				"Allvarlig fel vid laddning av ECO-fil"
::load::mc::FileIsCorrupt			"Filen %s är skadad:"
::load::mc::ProgramAborting		"Programmet avbryter."
::load::mc::EngineSetupFailed		"Loading engine configuration failed" ;# NEW

::load::mc::Loading					"Laddar %s"
::load::mc::StartupFinished		"Inläsning klar"
::load::mc::SystemEncoding			"Systemkodning är '%s'"

::load::mc::ReadingFile(options)	"Läser alternativ"
::load::mc::ReadingFile(engines)	"Reading engines file" ;# NEW

::load::mc::ECOFile					"ECO-fil"
::load::mc::EngineFile				"schackmotor"
::load::mc::SpellcheckFile			"spelarinformation"
::load::mc::LocalizationFile		"lokaliseringsfilen"
::load::mc::RatingList				"%s ratinglista"
::load::mc::WikipediaLinks			"Wikipedia länkar"
::load::mc::ChessgamesComLinks	"chessgames.com länkar"
::load::mc::Cities					"städer"
::load::mc::PieceSet					"pjäser"
::load::mc::Theme						"teman"
::load::mc::Icons						"ikoner"

### archive ############################################################
::archive::mc::CorruptedArchive			"Arkiv '%s' är skadad."
::archive::mc::NotAnArchive				"'%s' är inte ett arkiv."
::archive::mc::CorruptedHeader			"Arkivhuvud i '%s' är skadat."
::archive::mc::CannotCreateFile			"Misslyckades att skapa fil '%s'."
::archive::mc::FailedToExtractFile		"Misslyckades att extrahera fil '%s'."
::archive::mc::UnknownCompression		"Okänd kompression '%s'."
::archive::mc::ChecksumError				"Fel kontrollsumma vid extrahering av '%s'."
::archive::mc::ChecksumErrorDetail		"Extraherad fil '%s' kommer vara skadad."
::archive::mc::FileNotReadable			"Filen '%s' går inte att läsa."
::archive::mc::UsingRawInstead			"Använder kompression 'raw' istället."
::archive::mc::CannotOpenArchive			"Kan inte öppna arkiv '%s'."
::archive::mc::CouldNotCreateArchive	"Kan inte skapa arkiv '%s'."

::archive::mc::PackFile						"Packa %s"
::archive::mc::UnpackFile					"Packa upp %s"

### player photos ######################################################
::util::photos::mc::InstallPlayerPhotos		"Install/Update Player Photos" ;# NEW
::util::photos::mc::TimeOut						"Timeout occurred." ;# NEW
::util::photos::mc::EnterPassword				"Personal Password" ;# NEW
::util::photos::mc::Download						"Download" ;# NEW
::util::photos::mc::SharedInstallation			"Shared installation" ;# NEW
::util::photos::mc::LocalInstallation			"Private installation" ;# NEW
::util::photos::mc::RetryLater					"Please retry later." ;# NEW
::util::photos::mc::DownloadStillInProgress	"Download of photo files is still in progress." ;# NEW
::util::photos::mc::PhotoFiles					"Player Photo Files" ;# NEW

::util::photos::mc::RequiresSuperuserRights	"The installation/update requires super-user rights.\n\nNote that the password will not be accepted if your user is not in the sudoers file."
::util::photos::mc::RequiresInternetAccess	"The installation/update of the player photo files requires an internet connection." ;# NEW
::util::photos::mc::AlternativelyDownload(0)	"Alternatively you may download the photo files from %link%. Install these files into directory %local%." ;# NEW
::util::photos::mc::AlternativelyDownload(1)	"Alternatively you may download the photo files from %link%. Install these files into the shared directory %shared%, or into the private directory %local%." ;# NEW

::util::photos::mc::Error(nohttp)				"Cannot open an internet connection because package TclHttp is not installed." ;# NEW
::util::photos::mc::Error(busy)					"The installation/update is already running." ;# NEW
::util::photos::mc::Error(failed)				"Unexpected error: The invocation of the sub-process has failed." ;# NEW
::util::photos::mc::Error(passwd)				"The password is wrong." ;# NEW
::util::photos::mc::Error(nosudo)				"Cannot invoke 'sudo' command because your user is not in the sudoers file." ;# NEW
::util::photos::mc::Detail(nosudo)				"As a workaround you may do a private installation, or start this application as a super-user." ;# NEW

::util::photos::mc::Message(uptodate)			"The photo files are still up-to-date." ;# NEW
::util::photos::mc::Message(finished)			"The installation/update of photo files has finished." ;# NEW
::util::photos::mc::Message(broken)				"Broken Tcl library version." ;# NEW
::util::photos::mc::Message(noperm)				"You dont have write permissions for directory '%s'." ;# NEW
::util::photos::mc::Message(missing)			"Cannot find directory '%s'." ;# NEW
::util::photos::mc::Message(httperr)			"HTTP error: %s" ;# NEW
::util::photos::mc::Message(httpcode)			"Unexpected HTTP code %s." ;# NEW
::util::photos::mc::Message(noconnect)			"HTTP connection failed." ;# NEW
::util::photos::mc::Message(timeout)			"HTTP timeout occurred." ;# NEW
::util::photos::mc::Message(crcerror)			"Checksum error occurred. Possibly the file server is currently in maintenance mode." ;# NEW
::util::photos::mc::Message(maintenance)		"Photo file server maintenance is currently in progress." ;# NEW
::util::photos::mc::Message(notfound)			"Download aborted because photo file server maintenance is currently in progress." ;# NEW
::util::photos::mc::Message(aborted)			"User has aborted download." ;# NEW
::util::photos::mc::Message(killed)				"Unexpected termination of download. The sub-process has died." ;# NEW

::util::photos::mc::Detail(nohttp)				"Please install package TclHttp, for example %s." ;# NEW
::util::photos::mc::Detail(noconnect)			"Probably you don't have an internet connection." ;# NEW
::util::photos::mc::Detail(badhost)				"Another possibility is a bad host, or a bad port." ;# NEW

::util::photos::mc::Log(started)					"Installation/update of photo files started at %s." ;# NEW
::util::photos::mc::Log(finished)				"Installation/update of photo files finished at %s." ;# NEW
::util::photos::mc::Log(destination)			"Destination directory for photo file download is '%s'." ;# NEW
::util::photos::mc::Log(created:1)			"%s file created." ;# NEW
::util::photos::mc::Log(created:N)			"%s file(s) created." ;# NEW
::util::photos::mc::Log(deleted:1)			"%s file deleted." ;# NEW
::util::photos::mc::Log(deleted:N)			"%s file(s) deleted." ;# NEW
::util::photos::mc::Log(skipped:1)			"%s file skipped." ;# NEW
::util::photos::mc::Log(skipped:N)			"%s file(s) skipped." ;# NEW
::util::photos::mc::Log(updated:1)			"%s file updated." ;# NEW
::util::photos::mc::Log(updated:N)			"%s file(s) updated." ;# NEW

### application ########################################################
::application::mc::Database				"&Databas"
::application::mc::Board					"&Bräde"
::application::mc::MainMenu				"&Huvudmeny"

::application::mc::DockWindow				"Docka fönster"
::application::mc::UndockWindow			"Avdocka fönster"
::application::mc::ChessInfoDatabase	"Chess Information Data Base"
::application::mc::Shutdown				"Avstängning..."
::application::mc::QuitAnyway				"Quit anyway?" ;# NEW

::application::mc::UpdatesAvailable		"Updates available" ;# NEW

### application::board #################################################
::application::board::mc::ShowCrosstable	"Visa turneringstabell för partiet"
::application::board::mc::StartEngine		"Start chess analysis engine" ;# NEW
::application::board::mc::StopEngine		"Stop chess analysis engine" ;# NEW

::application::board::mc::Tools				"Verktyg"
::application::board::mc::Control			"Kontroll"
::application::board::mc::Game				"Parti"
::application::board::mc::GoIntoNextVar	"Gå in i nästa variant"
::application::board::mc::GoIntPrevVar		"Gå in i föregående variant"
::application::board::mc::LoadGame(next)	"Load next game" ;# NEW
::application::board::mc::LoadGame(prev)	"Load previous game" ;# NEW
::application::board::mc::LoadGame(first)	"Load first game" ;# NEW
::application::board::mc::LoadGame(last)	"Load last game" ;# NEW

::application::board::mc::Accel(edit-annotation)	"A"
::application::board::mc::Accel(edit-comment)		"C"
::application::board::mc::Accel(edit-marks)			"M"
::application::board::mc::Accel(add-new-game)		"S" ;# NEW
::application::board::mc::Accel(replace-game)		"R" ;# NEW
::application::board::mc::Accel(replace-moves)		"V" ;# NEW
::application::board::mc::Accel(trial-mode)			"T" ;# NEW

### application::database ##############################################
::application::database::mc::FileOpen							"Öppna databas..."
::application::database::mc::FileOpenRecent					"Öppna senaste"
::application::database::mc::FileNew							"Ny databas..."
::application::database::mc::FileExport						"Exportera..."
::application::database::mc::FileImport(pgn)					"Importera PGN fil..."
::application::database::mc::FileImport(db)					"Import Databases..." ;# NEW
::application::database::mc::FileCreate						"Skapa arkiv..."
::application::database::mc::FileClose							"Stäng"
::application::database::mc::FileCompact						"Komprimera"
::application::database::mc::HelpSwitcher						"Hjälp om databasväljare"

::application::database::mc::Games								"&Partier"
::application::database::mc::Players							"&Spelare"
::application::database::mc::Events								"&Tävlingar"
::application::database::mc::Sites								"&Platser"
::application::database::mc::Annotators						"&Kommentatorer"

::application::database::mc::File								"Fil"
::application::database::mc::SymbolSize						"Symbol storlek"
::application::database::mc::Large								"Stor"
::application::database::mc::Medium								"Mellan"
::application::database::mc::Small								"Liten"
::application::database::mc::Tiny								"Mycket liten"
::application::database::mc::Empty								"tom"
::application::database::mc::None								"ingen"
::application::database::mc::Failed								"misslyckades"
::application::database::mc::LoadMessage						"Öppnar databas %s"
::application::database::mc::UpgradeMessage					"Upgraderar databas %s"
::application::database::mc::CompactMessage					"Komprimerar databas %s"
::application::database::mc::CannotOpenFile					"Kan inte öppna fil '%s'."
::application::database::mc::EncodingFailed					"Kodning %s misslyckades."
::application::database::mc::DatabaseAlreadyOpen			"Databasen '%s' är redan öppen."
::application::database::mc::Properties						"Egenskaper"
::application::database::mc::Preload							"Förinläsning"
::application::database::mc::MissingEncoding					"Saknar kodning %s (använder %s istället)"
::application::database::mc::DescriptionTooLarge			"Beskrivningen är för stor."
::application::database::mc::DescrTooLargeDetail			"Posten innehåller %d tecken, men bara %d tecken är tillåtet."
::application::database::mc::ClipbaseDescription			"Temporär databas, lagras inte på disk."
::application::database::mc::HardLinkDetected				"Kan inte ladda filen '%file1' därför den redan är laddad som filen '%file2'. Det kan bara hända när hård länkar är involverade."
::application::database::mc::HardLinkDetectedDetail		"Om vi laddar den här databasen två gånger kan applikation krasha pga trådanvändandet."
::application::database::mc::UriRejectedDetail(open)		"Bara Scidb databaser kan öppnas:"
::application::database::mc::UriRejectedDetail(import)	"Only Scidb databases can be imported:" ;# NEW
::application::database::mc::EmptyUriList						"Innehåll som släpps är tomt."
::application::database::mc::OverwriteExistingFiles		"Skriver över existerande filer i folder '%s'?"
::application::database::mc::SelectDatabases					"Välj databaser som ska öppnas"
::application::database::mc::ExtractArchive					"Packa upp arkiv %s"
::application::database::mc::CompactDetail					"Alla partier måste stängas in komprimeringen kan börjas."
::application::database::mc::ReallyCompact					"Är du säker att databasen '%s' ska komprimeras?"
::application::database::mc::ReallyCompactDetail(1)		"Endast ett parti kommer bli raderade."
::application::database::mc::ReallyCompactDetail(N)		"%s partier kommer bli raderade."
::application::database::mc::CopyGames							"Copy games" ;# NEW
::application::database::mc::CopyGamesFromTo					"Copy games from '%src' to '%dst'" ;# NEW
::application::database::mc::CopiedGames						"%s game(s) copied"
::application::database::mc::NoGamesCopied					"No games copied"
::application::database::mc::CopyAllGames						"Copy all games (%num) from '%src'"
::application::database::mc::CopyFilteredGames				"Copy only filtered games (%num) from '%src'"
::application::database::mc::ImportGames						"Import games" ;# NEW
::application::database::mc::ImportOneGameTo(0)				"Copy one game to '%dst'?" ;# NEW
::application::database::mc::ImportOneGameTo(1)				"Copy about one game to '%dst'?" ;# NEW
::application::database::mc::ImportGamesTo(0)				"Copy %num games to '%dst'?" ;# NEW
::application::database::mc::ImportGamesTo(1)				"Copy about %num games to '%dst'?" ;# NEW
::application::database::mc::ImportFiles						"Import Files:" ;# NEW

::application::database::mc::RecodingDatabase				"Omkodar %base från %from till %to"
::application::database::mc::RecodedGames						"%s parti(er) omkodade"

::application::database::mc::GameCount							"Partier"
::application::database::mc::DatabasePath						"Databaskatalog"
::application::database::mc::DeletedGames						"Raderade partier"
::application::database::mc::Description						"Beskrivning"
::application::database::mc::Created							"Skapad"
::application::database::mc::LastModified						"Senast ändrad"
::application::database::mc::Encoding							"Kodning"
::application::database::mc::YearRange							"Årtalsintervall"
::application::database::mc::RatingRange						"Ratingintervall"
::application::database::mc::Result								"Resultat"
::application::database::mc::Score								"Poäng"
::application::database::mc::Type								"Typ"
::application::database::mc::ReadOnly							"Skrivskydda"

::application::database::mc::ChangeIcon						"Byt ikon"
::application::database::mc::Recode								"Omkoda"
::application::database::mc::EditDescription					"Redigera beskrivning"
::application::database::mc::EmptyClipbase					"Töm Clipbase"

::application::database::mc::T_Unspecific						"Ospecifik"
::application::database::mc::T_Temporary						"Temporär"
::application::database::mc::T_Work								"Arbete"
::application::database::mc::T_Clipbase						"Clipbase"
::application::database::mc::T_MyGames							"Mina partier"
::application::database::mc::T_Informant						"Informant"
::application::database::mc::T_LargeDatabase					"Stordatabas"
::application::database::mc::T_CorrespondenceChess			"Korrschack"  
::application::database::mc::T_EmailChess						"E-post schack"
::application::database::mc::T_InternetChess					"Internetschack"
::application::database::mc::T_ComputerChess					"Datorschack"
::application::database::mc::T_Chess960						"Schack960"
::application::database::mc::T_PlayerCollection				"Spelarsamling"
# Female version of "Player Collection"
# Be sure that the translation starts with same term as the translation above.
::application::database::mc::T_PlayerCollectionFemale		"Player Collection" ;# NEW
::application::database::mc::T_Tournament						"Turnering"
::application::database::mc::T_TournamentSwiss				"Schweizer-turnering"
::application::database::mc::T_GMGames							"GM partier"
::application::database::mc::T_IMGames							"IM partier"
::application::database::mc::T_BlitzGames						"Blixtpartier"
::application::database::mc::T_Tactics							"Taktik"
::application::database::mc::T_Endgames						"Slutspel"
::application::database::mc::T_Analysis						"Analyser"
::application::database::mc::T_Training						"Träning"
::application::database::mc::T_Match							"Matcher"
::application::database::mc::T_Studies							"Studier"
::application::database::mc::T_Jewels							"Juveler"
::application::database::mc::T_Problems						"Problem"
::application::database::mc::T_Patzer							"Träflyttning"
::application::database::mc::T_Gambit							"Gambit"
::application::database::mc::T_Important						"Viktigt"
::application::database::mc::T_Openings						"Öppningar"
::application::database::mc::T_OpeningsWhite					"Vita öppningar"
::application::database::mc::T_OpeningsBlack					"Svarta öppningar"
::application::database::mc::T_Bughouse						"Bughouse Chess" ;# NEW
::application::database::mc::T_Antichess						"Antichess" ;# NEW
::application::database::mc::T_PGNFile							"PGN fil"

::application::database::mc::OpenDatabase						"Öppna databas"
::application::database::mc::NewDatabase						"Ny databas"
::application::database::mc::CloseDatabase					"Stäng databas '%s'"
::application::database::mc::SetReadonly						"Sätt databasen '%s' skrivskyddad"
::application::database::mc::SetWriteable						"Sätt databasen '%s' skrivbar"

::application::database::mc::OpenReadonly						"Öppna skrivskyddat"
::application::database::mc::OpenWriteable					"Öppna skrivbart"

::application::database::mc::UpgradeDatabase					"%s är ett gammalt databasformat som inte kan öppnas skrivbart.\n\nEn uppgradering kommer skapa en ny version av databasen och efter det radera orginalfilerna.\n\nDet här kan ta en tid, men behöver bara göras en gång.\n\nVill du uppgradera databasen nu?"
::application::database::mc::UpgradeDatabaseDetail			"\"Nej\" kommer öppna databasen skrivskyddat och kan inte göras skrivbar."

### application::database::games #######################################
::application::database::games::mc::Control						"Kontroll"
::application::database::games::mc::GameNumber					"Partinummer"

::application::database::games::mc::GotoFirstPage				"Gå till första sidan av partier"
::application::database::games::mc::GotoLastPage				"Gå till sista sidan av partier"
::application::database::games::mc::PreviousPage				"Föregående sida av partier"
::application::database::games::mc::NextPage						"Nästa sida av partier"
::application::database::games::mc::GotoCurrentSelection		"Gå till aktuell markering"
::application::database::games::mc::UseVerticalScrollbar		"Lodrät rullningslist"
::application::database::games::mc::UseHorizontalScrollbar	"Vågrät rullningslist"
::application::database::games::mc::GotoEnteredGameNumber	"Gå till angivit partinummer"

### application::database::players #####################################
::application::database::players::mc::EditPlayer				"Redigera spelare"
::application::database::players::mc::Score						"Poäng"
::application::database::players::mc::TooltipRating			"Rating: %s"

### application::database::annotators ##################################
::application::database::annotators::mc::F_Annotator		"Kommentator"
::application::database::annotators::mc::F_Frequency		"Frekvens"

::application::database::annotators::mc::Find				"Sök"
::application::database::annotators::mc::FindAnnotator	"Sök kommentator"
::application::database::annotators::mc::ClearEntries		"Rensa poster"
::application::database::annotators::mc::NotFound			"Hittades ej."

### application::pgn ###################################################
::application::pgn::mc::Command(move:comment)			"Sätt kommentar"
::application::pgn::mc::Command(move:marks)				"Sätt markering"
::application::pgn::mc::Command(move:annotation)		"Sätt schacktecken/kommentar/markering"
::application::pgn::mc::Command(move:append)				"Lägg till drag"
::application::pgn::mc::Command(move:nappend)			"Lägg till drag"
::application::pgn::mc::Command(move:exchange)			"Byt ut drag"
::application::pgn::mc::Command(variation:new)			"Lägg till variant"
::application::pgn::mc::Command(variation:replace)		"Ersätt drag"
::application::pgn::mc::Command(variation:truncate)	"Trunkera variant"
::application::pgn::mc::Command(variation:first)		"Ange som huvudvariant"
::application::pgn::mc::Command(variation:promote)		"Flytta upp variant till huvudlinje"
::application::pgn::mc::Command(variation:remove)		"Radera variant"
::application::pgn::mc::Command(variation:mainline)	"Ny huvudlinje"
::application::pgn::mc::Command(variation:insert)		"Infoga drag"
::application::pgn::mc::Command(variation:exchange)	"Byt ut drag"
::application::pgn::mc::Command(strip:moves)				"Drag från början"
::application::pgn::mc::Command(strip:truncate)			"Drag till slutet"
::application::pgn::mc::Command(strip:annotations)		"Schacktecken"
::application::pgn::mc::Command(strip:info)				"Drag information"
::application::pgn::mc::Command(strip:marks)				"Markering"
::application::pgn::mc::Command(strip:comments)			"Kommentarer"
::application::pgn::mc::Command(strip:variations)		"Varianter"
::application::pgn::mc::Command(copy:comments)			"Kopiera kommentarer"
::application::pgn::mc::Command(move:comments)			"Flytta kommentarer"
::application::pgn::mc::Command(game:clear)				"Rensa parti"
::application::pgn::mc::Command(game:transpose)			"Transponera parti"

::application::pgn::mc::StartTrialMode						"Starta testmode"
::application::pgn::mc::StopTrialMode						"Avsluta testmode"
::application::pgn::mc::Strip									"Rensa"
::application::pgn::mc::InsertDiagram						"Infoga diagram"
::application::pgn::mc::InsertDiagramFromBlack			"Infoga diagram från svarts sida"
::application::pgn::mc::SuffixCommentaries				"Suffixed Commentaries"
::application::pgn::mc::StripOriginalComments			"Rensa original kommentarer"

::application::pgn::mc::LanguageSelection					"Språk" ;# NEW change to "Language Selection"
::application::pgn::mc::MoveNotation						"Notation"
::application::pgn::mc::CollapseVariations				"Visa varianter"
::application::pgn::mc::ExpandVariations					"Dölj varianter"
::application::pgn::mc::EmptyGame							"Töm parti"

::application::pgn::mc::NumberOfMoves						"Antal halvdrag (i huvudlinje):"
::application::pgn::mc::InvalidInput						"Ogiltigt inmatning '%d'."
::application::pgn::mc::MustBeEven							"Inmatning måste vara ett jämnt nummer."
::application::pgn::mc::MustBeOdd							"Inmatning måste vara ett ojämnt nummer."
::application::pgn::mc::CannotOpenCursorFiles			"Kan inte öppna markörfilen: %s"
::application::pgn::mc::ReallyReplaceMoves				"Är du säker att dragen ska ersättas i aktuellt parti?"
::application::pgn::mc::CurrentGameIsNotModified		"Aktuelt parti är inte ändrat."

::application::pgn::mc::EditAnnotation						"Redigera schacktecken"
::application::pgn::mc::EditMoveInformation				"Redigera draginformation"
::application::pgn::mc::EditCommentBefore					"Redigera kommentar före drag"
::application::pgn::mc::EditCommentAfter					"Redigera kommentar efter drag"
::application::pgn::mc::EditPrecedingComment				"Redigera föregående kommentar"
::application::pgn::mc::EditTrailingComment				"Redigera efterföljande kommentar"
::application::pgn::mc::EditMarks							"Redigera markeringar"
::application::pgn::mc::Display								"Display"
::application::pgn::mc::None									"ingen"

### application::tree ##################################################
::application::tree::mc::Total								"Total"
::application::tree::mc::Control								"Kontroll"
::application::tree::mc::ChooseReferenceBase				"Välj referensdatabas"
::application::tree::mc::ReferenceBaseSwitcher			"Referensdatabas växel"
::application::tree::mc::Numeric								"Numerisk"
::application::tree::mc::Bar									"Bar"
::application::tree::mc::StartSearch						"Börja sökning"
::application::tree::mc::StopSearch							"Sluta sökning"
::application::tree::mc::UseExactMode						"Använd positions sökning"
::application::tree::mc::UseFastMode						"Använd accelererad sökning"
::application::tree::mc::UseQuickMode						"Använd snabbsökning"
::application::tree::mc::AutomaticSearch					"Automatisk sökning"
::application::tree::mc::LockReferenceBase				"Lås referensdatabas"
::application::tree::mc::SwitchReferenceBase				"Växla referensdatabas"
::application::tree::mc::TransparentBar					"Transparent bar"

::application::tree::mc::FromWhitesPerspective			"Från vits sida"
::application::tree::mc::FromBlacksPerspective			"Från svarts sida"
::application::tree::mc::FromSideToMovePerspective		"Från sidan som är vid draget"
::application::tree::mc::FromWhitesPerspectiveTip		"Poäng från vits sida"
::application::tree::mc::FromBlacksPerspectiveTip		"Poäng från svarts sida"

::application::tree::mc::TooltipAverageRating			"Medelrating (%s)"
::application::tree::mc::TooltipBestRating				"Max rating (%s)"

::application::tree::mc::F_Number							"#"
::application::tree::mc::F_Move								"Drag"
::application::tree::mc::F_Eco								"ECO"
::application::tree::mc::F_Frequency						"Frekvens"
::application::tree::mc::F_Ratio								"Kvot"
::application::tree::mc::F_Score								"Poäng"
::application::tree::mc::F_Draws								"Remier"
::application::tree::mc::F_Performance						"Prestation"
::application::tree::mc::F_AverageYear						"\u00f8 År"
::application::tree::mc::F_LastYear							"Senast spelad"
::application::tree::mc::F_BestPlayer						"Bästa spelare"
::application::tree::mc::F_FrequentPlayer					"Frekventa spelare"

::application::tree::mc::T_Number							"Numeration"
::application::tree::mc::T_AverageYear						"Medelår"
::application::tree::mc::T_FrequentPlayer					"Mest frekvent spelare"

### board ##############################################################
::board::mc::CannotReadFile		"Kan inte läsa filen '%s':"
::board::mc::CannotFindFile		"Kan inte hitta filen '%s'"
::board::mc::FileWillBeIgnored	"'%s' kommer ignoreras (dubbla ID)"
::board::mc::IsCorrupt				"'%s' är skadad (okänd %s stil '%s')"

::board::mc::ThemeManagement		"Temahantering"
::board::mc::Setup					"Inställningar"

::board::mc::WorkingSet				"Arbetsuppsättning"

### board::options #####################################################
::board::options::mc::Coordinates			"Kordinater"
::board::options::mc::SolidColor				"Enfärgad"
::board::options::mc::EditList				"Redigera lista"
::board::options::mc::Embossed				"Relief"
::board::options::mc::Highlighting			"Markerade"
::board::options::mc::Border					"Ram"
::board::options::mc::SaveWorkingSet		"Spara arbetsuppsättning"
::board::options::mc::SelectedSquare		"Markerad ruta"
::board::options::mc::ShowBorder				"Visa ram"
::board::options::mc::ShowCoordinates		"Visa kordinater"
::board::options::mc::ShowMaterialValues	"Visa materiella värde"
::board::options::mc::ShowMaterialBar		"Visa material stapel"
::board::options::mc::ShowSideToMove		"Visa sida vid draget"
::board::options::mc::ShowSuggestedMove	"Visa föreslagna drag"
::board::options::mc::SuggestedMove			"Föreslagna drag"
::board::options::mc::Basic					"Enkelt"
::board::options::mc::PieceStyle				"Pjäser"
::board::options::mc::SquareStyle			"Bräde"
::board::options::mc::Styles					"Stilar"
::board::options::mc::Show						"Förhandsgranska"
::board::options::mc::ChangeWorkingSet		"Redigera arbetsuppsättning"
::board::options::mc::CopyToWorkingSet		"Kopiera till arbetsuppsättning"
::board::options::mc::NameOfPieceStyle		"Ange namn för pjässtil"
::board::options::mc::NameOfSquareStyle	"Ange namn för brädstil"
::board::options::mc::NameOfThemeStyle		"Ange namn för tema"
::board::options::mc::PieceStyleSaved		"Pjässtil '%s' sparad som '%s'"
::board::options::mc::SquareStyleSaved		"Brädstil '%s' sparad som '%s'"
::board::options::mc::ChooseColors			"Välj färger"
::board::options::mc::SupersedeSuggestion	"Supersede/use suggested colors from square style"
::board::options::mc::CannotDelete			"Kan inte radera '%s'."
::board::options::mc::IsWriteProtected		"Fil '%s' är skrivskyddat."
::board::options::mc::ConfirmDelete			"Är du säker du vill radera '%s'?"
::board::options::mc::NoPermission			"Kan inte radera '%s'.\nÅtkomst nekad."
::board::options::mc::BoardSetup				"Brädesinställningar"
::board::options::mc::OpenTextureDialog	"Öppna texturdialog"

::board::options::mc::YouCannotReverse		"Du kan inte ta tillbaka den här handlingen. Filen '%s' kommer fysiskt raderas."

::board::options::mc::CannotUsePieceWorkingSet "Kan inte skapa nytt tema med %s markerad för pjässtil.\n Först måste du spara den nya pjässtilen, eller välja en annan pjässtil."

::board::options::mc::CannotUseSquareWorkingSet "Kan inte skapa nytt tema med %s markerad för brädstil.\n Först måste du spara den nya brädstilen, eller välja en annan brädstil."

### board::piece #######################################################
::board::piece::mc::Start						"Start"
::board::piece::mc::Stop						"Stopp"
::board::piece::mc::HorzOffset				"Vågrät förskjutning"
::board::piece::mc::VertOffset				"Lodrät förskjutning"
::board::piece::mc::Gradient					"Gradient"
::board::piece::mc::Fill						"Fyllning"
::board::piece::mc::Stroke						"Streck"
::board::piece::mc::Contour					"Kontur"
::board::piece::mc::WhiteShape				"Vit form"
::board::piece::mc::PieceSelection			"Pjäs markering"
::board::piece::mc::BackgroundSelection	"Bakgrund markering"
::board::piece::mc::Zoom						"Zoom"
::board::piece::mc::Shadow						"Skugga"
::board::piece::mc::Opacity					"Genomskinlighet"
::board::piece::mc::ShadowDiffusion			"Skuggspridning"
::board::piece::mc::PieceStyleConf			"Pjässtil konfiguration"
::board::piece::mc::Offset						"Offset"
::board::piece::mc::Rotate						"Rotera"
::board::piece::mc::CloseDialog				"Stäng dialog och kasta bort ändringar?"
::board::piece::mc::OpenTextureDialog		"Öppna texturdialog"

### board::square ######################################################
::board::square::mc::SolidColor			"Enfärgad"
::board::square::mc::CannotReadFile		"Kan inte läsa fil"
::board::square::mc::Zoom					"Zoom"
::board::square::mc::Offset				"Offset"
::board::square::mc::Rotate				"Rotera"
::board::square::mc::Borderline			"Kantlinje"
::board::square::mc::Width					"Bredd"
::board::square::mc::Opacity				"Genomskinlighet"
::board::square::mc::GapBetweenSquares	"Mellanrum mellan rutor"
::board::square::mc::Highlighting		"Upplyst"
::board::square::mc::Selected				"Markerad"
::board::square::mc::SuggestedMove		"Föreslagit drag"
::board::square::mc::Show					"Förhandsgranskning"
::board::square::mc::SquareStyleConf	"Rutformats konfiguration"
::board::square::mc::CloseDialog			"Stäng dialog och kasta bort ändringar?"

### board::texture #####################################################
::board::texture::mc::PreselectedOnly "Endast förvalda"

### pgn-setup ##########################################################
::pgn::setup::mc::Configure(editor)				"Customize Editor" ;# NEW
::pgn::setup::mc::Configure(browser)			"Customize Text Output" ;# NEW
::pgn::setup::mc::TakeOver(editor)				"Adopt settings from Game Browser" ;# NEW
::pgn::setup::mc::TakeOver(browser)				"Adopt settings from Game Editor" ;# NEW
::pgn::setup::mc::Pixel								"pixel" ;# NEW
::pgn::setup::mc::Spaces							"spaces" ;# NEW
::pgn::setup::mc::RevertSettings					"Revert to initial settings" ;# NEW
::pgn::setup::mc::ResetSettings					"Reset to factory settings" ;# NEW
::pgn::setup::mc::DiscardAllChanges				"Discard all applied changes?" ;# NEW

::pgn::setup::mc::Setup(Appearance)				"Appearance" ;# NEW
::pgn::setup::mc::Setup(Layout)					"Layout" ;# NEW
::pgn::setup::mc::Setup(Diagrams)				"Diagrams" ;# NEW
::pgn::setup::mc::Setup(MoveStyle)				"Move Style" ;# NEW

::pgn::setup::mc::Setup(Fonts)					"Fonts" ;# NEW
::pgn::setup::mc::Setup(font-and-size)			"Text font and size" ;# NEW
::pgn::setup::mc::Setup(figurine-font)			"Figurine (normal)" ;# NEW
::pgn::setup::mc::Setup(figurine-bold)			"Figurine (bold)" ;# NEW
::pgn::setup::mc::Setup(symbol-font)			"Symbols" ;# NEW

::pgn::setup::mc::Setup(Colors)					"Colors" ;# NEW
::pgn::setup::mc::Setup(Highlighting)			"Highlighting" ;# NEW
::pgn::setup::mc::Setup(start-position)		"Start Position" ;# NEW
::pgn::setup::mc::Setup(variations)				"Variations" ;# NEW
::pgn::setup::mc::Setup(numbering)				"Numbering" ;# NEW
::pgn::setup::mc::Setup(brackets)				"Brackets" ;# NEW
::pgn::setup::mc::Setup(illegal-move)			"Illegal Move" ;# NEW
::pgn::setup::mc::Setup(comments)				"Comments" ;# NEW
::pgn::setup::mc::Setup(annotation)				"Annotation" ;# NEW
::pgn::setup::mc::Setup(nagtext)					"NAG-Text" ;# NEW
::pgn::setup::mc::Setup(marks)					"Marks" ;# NEW
::pgn::setup::mc::Setup(move-info)				"Move Information" ;# NEW
::pgn::setup::mc::Setup(result)					"Result" ;# NEW
::pgn::setup::mc::Setup(current-move)			"Current Move" ;# NEW
::pgn::setup::mc::Setup(next-moves)				"Next Moves" ;# NEW
::pgn::setup::mc::Setup(empty-game)				"Empty Game" ;# NEW

::pgn::setup::mc::Setup(Hovers)					"Hovers" ;# NEW
::pgn::setup::mc::Setup(hover-move)				"Move" ;# NEW
::pgn::setup::mc::Setup(hover-comment)			"Comment" ;# NEW
::pgn::setup::mc::Setup(hover-move-info)		"Move Information" ;# NEW

::pgn::setup::mc::Section(ParLayout)			"Paragraph Layout" ;# NEW
::pgn::setup::mc::ParLayout(use-spacing)		"Använd styckeavstånd"
::pgn::setup::mc::ParLayout(column-style)		"Kolumnformat"
::pgn::setup::mc::ParLayout(tabstop-1)			"Indent for White Move" ;# NEW
::pgn::setup::mc::ParLayout(tabstop-2)			"Indent for Black Move" ;# NEW
::pgn::setup::mc::ParLayout(mainline-bold)	"Fet text för huvudlinjens drag"

::pgn::setup::mc::Section(Variations)			"Variation Layout" ;# NEW
::pgn::setup::mc::Variations(width)				"Indent Width" ;# NEW
::pgn::setup::mc::Variations(level)				"Indent Level" ;# NEW

::pgn::setup::mc::Section(Display)				"Display" ;# NEW
::pgn::setup::mc::Display(numbering)			"Show Variation Numbering" ;# NEW
::pgn::setup::mc::Display(moveinfo)				"Show Move Information" ;# NEW
::pgn::setup::mc::Display(nagtext)				"Show text for unusual NAG comments" ;# NEW

::pgn::setup::mc::Section(Diagrams)				"Diagrams" ;# NEW
::pgn::setup::mc::Diagrams(show)					"Visa diagram"
::pgn::setup::mc::Diagrams(square-size)		"Square Size" ;# NEW
::pgn::setup::mc::Diagrams(indentation)		"Indent Width" ;# NEW

### engine #############################################################
::engine::mc::Information				"Information" ;# NEW
::engine::mc::Features					"Features" ;# NEW
::engine::mc::Options					"Options" ;# NEW

::engine::mc::Name						"Name" ;# NEW
::engine::mc::Identifier				"Identifier" ;# NEW
::engine::mc::Author						"Author" ;# NEW
::engine::mc::Webpage					"Webpage" ;# NEW
::engine::mc::Email						"Email" ;# NEW
::engine::mc::Country					"Country" ;# NEW
::engine::mc::Rating						"Rating" ;# NEW
::engine::mc::Logo						"Logo" ;# NEW
::engine::mc::Protocol					"Protocol" ;# NEW
::engine::mc::Parameters				"Parameters" ;# NEW
::engine::mc::Command					"Command" ;# NEW
::engine::mc::Directory					"Directory" ;# NEW
::engine::mc::Variants					"Variants" ;# NEW
::engine::mc::LastUsed					"Last used" ;# NEW

::engine::mc::Variant(standard)		"Standard" ;# NEW
::engine::mc::Variant(chess960)		"Chess 960" ;# NEW
::engine::mc::Variant(bughouse)		"Bughouse" ;# NEW
::engine::mc::Variant(crazyhouse)	"Crazyhouse" ;# NEW
# NOTE: Suicide is Antichess according to FICS rules
# NOTE: "Giveaway" is Antichess according to internatianal rules.
# NOTE: "Losers" is Antichess according to ICC rules
# NOTE: You may tarnslate "Suicide", "Giveaway", anmd "Losers" with the same term.
::engine::mc::Variant(suicide)		"Antichess" ;# NEW
::engine::mc::Variant(giveaway)		"Antichess" ;# NEW
::engine::mc::Variant(losers)			"Antichess" ;# NEW
::engine::mc::Variant(3check)			"Three-check" ;# NEW

::engine::mc::Edit						"Edit" ;# NEW
::engine::mc::View						"View" ;# NEW
::engine::mc::New							"New" ;# NEW
::engine::mc::Rename						"Rename" ;# NEW
::engine::mc::Delete						"Delete" ;# NEW
::engine::mc::Select(engine)			"Select engine" ;# NEW
::engine::mc::Select(profile)			"Select profile" ;# NEW
::engine::mc::ProfileName				"Profile name" ;# NEW
::engine::mc::NewProfileName			"New profile name" ;# NEW
::engine::mc::OldProfileName			"Old profile name" ;# NEW
::engine::mc::CopyFrom					"Copy from" ;# NEW
::engine::mc::NewProfile				"New Profile" ;# NEW
::engine::mc::RenameProfile			"Rename Profile" ;# NEW
::engine::mc::EditProfile				"Edit Profile '%s'" ;# NEW
::engine::mc::ProfileAlreadyExists	"A profile with name '%s' already exists." ;# NEW
::engine::mc::ChooseDifferentName	"Please choose a different name." ;# NEW
::engine::mc::ReservedName				"Name '%s' is reserved and cannot be used." ;# NEW
::engine::mc::ReallyDeleteProfile	"Really delete profile '%s'?" ;# NEW

::engine::mc::AdminEngines				"Manage Engines" ;# NEW
::engine::mc::SetupEngine				"Setup engine %s" ;# NEW
::engine::mc::ImageFiles				"Image files" ;# NEW
::engine::mc::SelectEngine				"Select Engine" ;# NEW
::engine::mc::SelectEngineLogo		"Select Engine Logo" ;# NEW
::engine::mc::EngineLog					"Engine Console" ;# NEW
::engine::mc::Probing					"Probing" ;# NEW
::engine::mc::NeverUsed					"Never used" ;# NEW
::engine::mc::OpenFsbox					"Open File Selection Dialog" ;# NEW
::engine::mc::DefaultValue				"Default value" ;# NEW
::engine::mc::ResetToDefault			"Reset to default" ;# NEW
::engine::mc::ShowInfo					"Show \"Info\"" ;# NEW don't translate "Info"
::engine::mc::TotalUsage				"%s times in total" ;# NEW
::engine::mc::Memory						"Memory (MB)" ;# NEW
::engine::mc::CPUs						"CPUs" ;# NEW
::engine::mc::Priority					"CPU Priority" ;# NEW
::engine::mc::ClearHash					"Clear hash tables" ;# NEW

::engine::mc::ConfirmNewEngine		"Confirm new engine" ;# NEW
::engine::mc::EngineAlreadyExists	"An entry with this engine already exists." ;# NEW
::engine::mc::CopyFromEngine			"Make a copy of entry" ;# NEW
::engine::mc::CannotOpenProcess		"Cannot start process." ;# NEW
::engine::mc::DoesNotRespond			"This engine does not respond either to UCI nor to XBoard/WinBoard protocol." ;# NEW
::engine::mc::DiscardChanges			"The current item has changed.\n\nReally discard changes?"
::engine::mc::ReallyDelete				"Really delete engine '%s'?" ;# NEW
::engine::mc::EntryAlreadyExists		"An entry with name '%s' already exists." ;# NEW
::engine::mc::NoFeaturesAvailable	"This engine does not provide any feature, not even an analyze mode is available. You cannot use this engine for the analysis of positions." ;# NEW
::engine::mc::NoStandardChess			"This engine does not support standard chess." ;# NEW
::engine::mc::NoEngineAvailable		"No engine available." ;# NEW
::engine::mc::FailedToCreateDir		"Failed to create directory '%s'." ;# NEW
::engine::mc::ScriptErrors				"Any errors while saving will be displayed here." ;# NEW
::engine::mc::CommandNotAllowed		"Usage of command '%s' is not allowed here." ;# NEW
::engine::mc::ThrowAwayChanges		"Throw away all changes?" ;# NEW
::engine::mc::ResetToDefaultContent	"Reset to default content" ;# NEW

::engine::mc::ProbeError(registration)			"This engine requires a registration." ;# NEW
::engine::mc::ProbeError(copyprotection)		"This engine is copy-protected." ;# NEW

::engine::mc::FeatureDetail(analyze)			"This engine provides an analyze mode." ;# NEW
::engine::mc::FeatureDetail(multiPV)			"Allows you to see the engine evaluations and principal variations (PVs) from the highest ranked candidate moves. This engines can show up to %s principal variations." ;# NEW
::engine::mc::FeatureDetail(pause)				"This provides a proper handling of pause/resume: the engine does not think, ponder, or otherwise consume significant CPU time. The current thinking or pondering (if any) is suspended and both player's clocks are stopped." ;# NEW
::engine::mc::FeatureDetail(playOther)			"The engine is capable to play your move. Your clock wiil run while the engine is thinking about your move." ;# NEW
::engine::mc::FeatureDetail(hashSize)			"This feature allows to inform the engine on how much memory it is allowed to use maximally for the hash tables. This engine allows a range between %min and %max MB." ;# NEW
::engine::mc::FeatureDetail(clearHash)			"The user may clear the hash tables whlle the engine is running." ;# NEW
::engine::mc::FeatureDetail(threads)			"It allows you to configure the number of threads the chess engine will use during its thinking. This engine is using between %min and %max threads." ;# NEW
::engine::mc::FeatureDetail(smp)					"More than one CPU (core) can be used by this engine." ;# NEW
::engine::mc::FeatureDetail(limitStrength)	"The engine is able to limit its strength to a specific Elo number between %min-%max." ;# NEW
::engine::mc::FeatureDetail(skillLevel)		"The engine provides the possibility to lower the skill down, where it can be beaten quite easier." ;# NEW
::engine::mc::FeatureDetail(ponder)				"Pondering is simply using the user's move time to consider likely user moves and thus gain a pre-processing advantage when it is our turn to move, also referred as Permanent brain." ;# NEW
::engine::mc::FeatureDetail(chess960)			"Chess960 (or Fischer Random Chess) is a variant of chess. The game employs the same board and pieces as standard chess, but the starting position of the pieces along the players' home ranks is randomized, with a few restrictions which preserves full castling options in all starting positions, resulting in 960 unique positions." ;# NEW
::engine::mc::FeatureDetail(bughouse)			"Bughouse chess (also called Exchange chess, Siamese chess, Tandem chess, Transfer chess, or Double Bughouse) is a chess variant played on two chessboards by four players in teams of two. Normal chess rules apply, except that captured pieces on one board are passed on to the players of the other board, who then have the option of putting these pieces on their board." ;# NEW
::engine::mc::FeatureDetail(crazyhouse)		"Crazyhouse (also known as Drop Chess) is a chess variant similar to bughouse chess, but with only two players. It effectively incorporates a rule in shogi (Japanese chess), in which a player can introduce a captured piece back to the board as his own." ;# NEW
::engine::mc::FeatureDetail(suicide)			"Suicide Chess (also called Antichess, Take Me Chess, Must Kill, Reverse Chess) has simple rules: capturing moves are mandatory and the object is to lose all pieces. There is no check, the king is captured like an ordinary piece. In case of stalemate the side with fewer pieces will win (according to FICS rules)." ;# NEW
::engine::mc::FeatureDetail(giveaway)			"Giveaway Chess (a variant of Antichess) is like Suicide Chess, but in case of stalemate the side which is stalemate wins (according to international rules)." ;# NEW
::engine::mc::FeatureDetail(losers)				"Losing Chess is a variant of Antichess, where the goal is to lose the chess game, but with several conditions attached to the rules. The goal is to lose all of your pieces (except the king), although in Losers Chess, you can also win by getting checkmated (according to ICC rules)." ;# NEW
::engine::mc::FeatureDetail(3check)				"The characteristic of this chess variant: a player wins if he checks his opponent three times." ;# NEW
::engine::mc::FeatureDetail(playingStyle)		"This engine provides different playing styles, namely %s. See the handbook of the engine for an explanation of the different styles." ;# NEW

### analysis ###########################################################
::application::analysis::mc::Control				"Control" ;# NEW
::application::analysis::mc::Information			"Information" ;# NEW
::application::analysis::mc::Setup					"Setup" ;# NEW
::application::analysis::mc::Pause					"Pause" ;# NEW
::application::analysis::mc::Resume					"Resume" ;# NEW
::application::analysis::mc::LockEngine			"Lock engine to current position" ;# NEW
::application::analysis::mc::MultipleVariations	"Multiple variations (multi-pv)" ;# NEW
::application::analysis::mc::HashFullness			"Hash fullness" ;# NEW
::application::analysis::mc::Hash					"Hash:" ;# NEW
::application::analysis::mc::Lines					"Lines:" ;# NEW
::application::analysis::mc::MateIn					"%color mate in %n" ;# NEW
::application::analysis::mc::BestScore				"Best score (of current lines)" ;# NEW
::application::analysis::mc::CurrentMove			"Currently searching this move" ;# NEW
::application::analysis::mc::TimeSearched			"Time searched" ;# NEW
::application::analysis::mc::SearchDepth			"Search depth in plies (Selective search depth)" ;# NEW
::application::analysis::mc::IllegalPosition		"Illegal position - Cannot analyze" ;# NEW

::application::analysis::mc::LinesPerVariation	"Lines per variation" ;# NEW
::application::analysis::mc::BestFirstOrder		"Sort by evaluation" ;# NEW
::application::analysis::mc::Engine					"Engine" ;# NEW

::application::analysis::mc::Seconds				"s" ;# NEW
::application::analysis::mc::Minutes				"m" ;# NEW

::application::analysis::mc::Status(mate)			"%s is mate" ;# NEW
::application::analysis::mc::Status(stalemate)	"%s is stalemate" ;# NEW

::application::analysis::mc::NotSupported(standard)	"This engine does not support standard chess." ;# NEW
::application::analysis::mc::NotSupported(chess960)	"This engine does not support chess 960." ;# NEW
::application::analysis::mc::NotSupported(analyze)		"This engine does not have an analysis mode." ;# NEW

::application::analysis::mc::Signal(stopped)		"Engine stopped by signal." ;# NEW
::application::analysis::mc::Signal(resumed)		"Engine resumed by signal." ;# NEW
::application::analysis::mc::Signal(killed)		"Engine killed by signal." ;# NEW
::application::analysis::mc::Signal(crashed)		"Engine crashed." ;# NEW
::application::analysis::mc::Signal(closed)		"Engine has closed connection." ;# NEW
::application::analysis::mc::Signal(terminated)	"Engine terminated with exit code %s." ;# NEW

### gametable ##########################################################
::gametable::mc::DeleteGame				"Markera parti som raderad"
::gametable::mc::UndeleteGame				"Ångra radering av partiet"
::gametable::mc::EditGameFlags			"Redigera partimarkeringar"
::gametable::mc::Custom						"Anpassat"

::gametable::mc::Monochrome				"Svartvit"
::gametable::mc::Transparent				"Genomskinlig"
::gametable::mc::Relief						"Relief"
::gametable::mc::ShowIdn					"Visa schack960 positionsnummer"
::gametable::mc::Icons						"Ikoner"
::gametable::mc::Abbreviations			"Förkortningar"

::gametable::mc::SortAscending			"Sortera (stigande)"
::gametable::mc::SortDescending			"Sortera (fallande)"
::gametable::mc::SortOnAverageElo		"Sortera på medel Elo (fallande)"
::gametable::mc::SortOnAverageRating	"Sortera på medel rating (fallande)"
::gametable::mc::SortOnDate				"Sortera på datum (fallande)"
::gametable::mc::SortOnNumber				"Sortera på partinummer (stigande)"
::gametable::mc::ReverseOrder				"Omvänd ordning"
::gametable::mc::NoMoves					"Inga drag"
::gametable::mc::NoMoreMoves				"Inga mer drag"
::gametable::mc::WhiteRating				"Vit rating"
::gametable::mc::BlackRating				"Svart rating"

::gametable::mc::Flags						"Flaggor"
::gametable::mc::PGN_CountryCode			"PGN landskod"
::gametable::mc::ISO_CountryCode			"ISO landskod"
::gametable::mc::ExcludeElo				"Exkludera Elo"
::gametable::mc::IncludePlayerType		"Inkludera spelartyp"
::gametable::mc::ShowTournamentTable	"Turneringstabell"

::gametable::mc::Long						"Lång"
::gametable::mc::Short						"Kort"

::gametable::mc::AccelBrowse				"W"
::gametable::mc::AccelOverview			"O"
::gametable::mc::AccelTournTable			"T"
::gametable::mc::Space						"Space"

::gametable::mc::F_Number					"#"
::gametable::mc::F_White					"Vit"
::gametable::mc::F_Black					"Svart"
::gametable::mc::F_Event					"Tävling"
::gametable::mc::F_Site						"Plats"
::gametable::mc::F_Date						"Datum"
::gametable::mc::F_Result					"Resultat"
::gametable::mc::F_Round					"Rond"
::gametable::mc::F_Annotator				"Kommentator"
::gametable::mc::F_Length					"Längd"
::gametable::mc::F_Termination			"Avslutning"
::gametable::mc::F_EventMode				"Mode"
::gametable::mc::F_Eco						"ECO"
::gametable::mc::F_Flags					"Flaggor"
::gametable::mc::F_Material				"Material"
::gametable::mc::F_Acv						"SKV"
::gametable::mc::F_Idn						"960"
::gametable::mc::F_Position				"Position"
::gametable::mc::F_EventDate				"Tävlingsdatum"
::gametable::mc::F_EventType				"Täv.typ"
::gametable::mc::F_Changed					"Ändrad"
::gametable::mc::F_Promotion				"Promovering"
::gametable::mc::F_UnderPromo				"Underpromovering"
::gametable::mc::F_StandardPos			"Standardposition"
::gametable::mc::F_Chess960Pos			"9"
::gametable::mc::F_Opening					"Öppning"
::gametable::mc::F_Variation				"Variant"
::gametable::mc::F_Subvariation			"Undervariant"
::gametable::mc::F_Overview				"Översikt"
::gametable::mc::F_Key						"Intern ECO-kod"

::gametable::mc::T_Number					"Nummer"
::gametable::mc::T_Acv						"Schacktecken / Kommentarer / Varianter"
::gametable::mc::T_WhiteRatingType		"Vit ratingytyp"
::gametable::mc::T_BlackRatingType		"Svart ratingtyp"
::gametable::mc::T_WhiteCountry			"Vit förbund"
::gametable::mc::T_BlackCountry			"Svart förbund"
::gametable::mc::T_WhiteTitle				"Vit titel"
::gametable::mc::T_BlackTitle				"Svart titel"
::gametable::mc::T_WhiteType				"Vit typ"
::gametable::mc::T_BlackType				"Svart typ"
::gametable::mc::T_WhiteSex				"Vit kön"
::gametable::mc::T_BlackSex				"Svart kön"
::gametable::mc::T_EventCountry			"Tävlingsland"
::gametable::mc::T_EventType				"Tävlingstyp"
::gametable::mc::T_Chess960Pos			"Schack960 position"
::gametable::mc::T_Deleted					"Raderad"
::gametable::mc::T_EngFlag					"Engelsk språkflagga"
::gametable::mc::T_OthFlag					"Övrig språkflagga"
::gametable::mc::T_Idn						"Chess 960 Position Number"
::gametable::mc::T_Annotations			"Schacktecken"
::gametable::mc::T_Comments				"Kommentarer"
::gametable::mc::T_Variations				"Varianter"
::gametable::mc::T_TimeMode				"Time Mode"

::gametable::mc::P_Rating					"Ratingpoäng"
::gametable::mc::P_RatingType				"Ratingtyp"
::gametable::mc::P_Country					"Land"
::gametable::mc::P_Title					"Titel"
::gametable::mc::P_Type						"Typ"
::gametable::mc::P_Date						"Datum"
::gametable::mc::P_Mode						"Mode"
::gametable::mc::P_Sex						"Kön"
::gametable::mc::P_Name						"Namn"

::gametable::mc::G_White					"Vit"
::gametable::mc::G_Black					"Svart"
::gametable::mc::G_Event					"Tävling"

::gametable::mc::EventType(game)			"Parti"
::gametable::mc::EventType(match)		"Match"
::gametable::mc::EventType(tourn)		"Turn."
::gametable::mc::EventType(swiss)		"Schw."
::gametable::mc::EventType(team)			"Lag"
::gametable::mc::EventType(k.o.)			"K.O."
::gametable::mc::EventType(simul)		"Simul"
::gametable::mc::EventType(schev)		"Schev"

::gametable::mc::PlayerType(human)		"Man/Kvinna"
::gametable::mc::PlayerType(program)	"Dator"

::gametable::mc::GameFlags(w)				"Vit öppning"
::gametable::mc::GameFlags(b)				"Svart öppning"
::gametable::mc::GameFlags(m)				"Mittspel"
::gametable::mc::GameFlags(e)				"Slutspel"
::gametable::mc::GameFlags(N)				"Nyhet"
::gametable::mc::GameFlags(p)				"Bondestruktur"
::gametable::mc::GameFlags(T)				"Taktik"
::gametable::mc::GameFlags(K)				"Kungsflygel"
::gametable::mc::GameFlags(Q)				"Damflygel"
::gametable::mc::GameFlags(!)				"Briljans"
::gametable::mc::GameFlags(?)				"Blunder"
::gametable::mc::GameFlags(U)				"Användare"
::gametable::mc::GameFlags(*)				"Best Game"
::gametable::mc::GameFlags(D)				"Decided Tournament"
::gametable::mc::GameFlags(G)				"Model Game"
::gametable::mc::GameFlags(S)				"Strategi"
::gametable::mc::GameFlags(^)				"Attack"
::gametable::mc::GameFlags(~)				"Offer"
::gametable::mc::GameFlags(=)				"Försvar"
::gametable::mc::GameFlags(M)				"Material"
::gametable::mc::GameFlags(P)				"Pjässpel"
::gametable::mc::GameFlags(t)				"Taktisk miss"
::gametable::mc::GameFlags(s)				"Strategisk miss"
::gametable::mc::GameFlags(C)				"Ogiltig rockad"
::gametable::mc::GameFlags(I)				"Ogiltigt drag"

### playertable ########################################################
::playertable::mc::F_LastName					"Efternamn"
::playertable::mc::F_FirstName				"Förnamn"
::playertable::mc::F_FideID					"Fide ID"
::playertable::mc::F_Title						"Titel"
::playertable::mc::F_Frequency				"Frekvens"

::playertable::mc::T_Federation				"Nation"
::playertable::mc::T_RatingType				"Ratingtyp"
::playertable::mc::T_Type						"Typ"
::playertable::mc::T_Sex						"Kön"
::playertable::mc::T_PlayerInfo				"Info Flag"

::playertable::mc::Find							"Hitta"
::playertable::mc::StartSearch				"Starta sökning"
::playertable::mc::ClearEntries				"Rensa"
::playertable::mc::NotFound					"Saknas."

::playertable::mc::Name							"Namn"
::playertable::mc::HighestRating				"Högsta rating"
::playertable::mc::MostRecentRating			"Senaste rating"
::playertable::mc::DateOfBirth				"Födelsedatum"
::playertable::mc::DateOfDeath				"Dödsdatum"
::playertable::mc::FideID						"Fide ID"

::playertable::mc::ShowPlayerCard			"Visa spelarkort..."

### eventtable #########################################################
::eventtable::mc::Attendance	"Deltagande"

### player-card ########################################################
::playercard::mc::PlayerCard					"Spelarkort"
::playercard::mc::Latest						"Senast"
::playercard::mc::Highest						"Högsta"
::playercard::mc::Minimal						"Minimal"
::playercard::mc::Maximal						"Maximal"
::playercard::mc::Win							"Vinster"
::playercard::mc::Draw							"Remier"
::playercard::mc::Loss							"Förluster"
::playercard::mc::Total							"Totalt"
::playercard::mc::FirstGamePlayed			"Första parti spelat"
::playercard::mc::LastGamePlayed				"Senaste parti spelat"
::playercard::mc::WhiteMostPlayed			"Vanligaste öppning som vit"
::playercard::mc::BlackMostPlayed			"Vanligaste öppning som svart"

::playercard::mc::OpenInWebBrowser			"Öppna i webbrowser"
::playercard::mc::OpenPlayerCard				"Öppna %s spelarkort"
::playercard::mc::OpenFileCard				"Öppna %s filkort"
::playercard::mc::OpenFideRatingHistory	"Öppna Fide ratinghistorik"
::playercard::mc::OpenWikipedia				"Öppna Wikipedia biografi"
::playercard::mc::OpenViafCatalog			"Öppna VIAF katalog"
::playercard::mc::OpenPndCatalog				"Öppna katalog i Deutsche Nationalbibliothek"
::playercard::mc::OpenChessgames				"chessgames.com partisamling"
::playercard::mc::SeachIn365ChessCom		"Sök i 365Chess.com"

### twm - tiled window manager #########################################
::twm::mc::Undock					"Avdocka"
::twm::mc::Close					"Stäng"

### fonts ##############################################################
::font::mc::ChessBaseFontsInstalled				"ChessBasefonter har installerats."
::font::mc::ChessBaseFontsInstallationFailed	"Installationen av ChessBasefonter misslyckades."
::font::mc::NoChessBaseFontFound					"Inga ChessBasefonter hittades i folder '%s'."
::font::mc::ChessBaseFontsAlreadyInstalled	"ChessBasefonter redan installerade. Ska installationen fortsätta ändå?"
::font::mc::ChooseMountPoint						"Monteringspunkt för installationspartition av Windows"
::font::mc::CopyingChessBaseFonts				"Kopierar ChessBasefonter"
::font::mc::CopyFile									"Kopiera fil %s"
::font::mc::UpdateFontCache						"Updatera font cache"

::font::mc::ChooseFigurineFont					"Choose figurine font" ;# NEW
::font::mc::ChooseSymbolFont						"Choose symbol font" ;# NEW
::font::mc::IncreaseFontSize						"Increase Font Size" ;# NEW
::font::mc::DecreaseFontSize						"Decrease Font Size" ;# NEW

### gamebar ############################################################
::gamebar::mc::StartPosition			"Startposition"
::gamebar::mc::Players					"Spelare"
::gamebar::mc::Event						"Tävling"
::gamebar::mc::Site						"Plats"
::gamebar::mc::SeparateHeader			"Separat rubrik"
::gamebar::mc::ShowActiveAtBottom	"Visa aktivt parti längst ned"
::gamebar::mc::ShowPlayersOnSeparateLines	"Visa spelare på skilda rader"
::gamebar::mc::DiscardChanges			"Partiet har ändrats.\n\nÄr du säker att ändringarna inte ska sparas?"
::gamebar::mc::DiscardNewGame			"Vill du verkligen kasta bort det här partiet?"
::gamebar::mc::NewGameFstPart			"Nytt"
::gamebar::mc::NewGameSndPart			"parti"

::gamebar::mc::LockGame					"Lås partiet"
::gamebar::mc::UnlockGame				"Lås upp partiet"
::gamebar::mc::CloseGame				"Stäng partiet"

::gamebar::mc::GameNew					"Nytt parti"
::gamebar::mc::GameNewChess960		"Nytt parti: Chess 960"
::gamebar::mc::GameNewChess960Sym	"Nytt parti: Chess 960 (endast symmetriskt)"
::gamebar::mc::GameNewShuffle			"Nytt parti: Shuffle Chess"

::gamebar::mc::AddNewGame				"Spara: Lägg till nytt parti till %s..."
::gamebar::mc::ReplaceGame				"Spara: Ersätt parti i %s..."
::gamebar::mc::ReplaceMoves			"Spara: Ersätt bara dragen i partiet..."

### browser ############################################################
::browser::mc::BrowseGame			"Titta igenom partiet"
::browser::mc::StartAutoplay		"Starta Autoplay"
::browser::mc::StopAutoplay		"Stoppa Autoplay"
::browser::mc::GoForward			"Gå framåt ett drag"
::browser::mc::GoBackward			"Gå bakåt ett drag"
::browser::mc::GoForwardFast		"Gå framåt flera drag"
::browser::mc::GoBackFast			"Gå bakåt flera drag"
::browser::mc::GotoStartOfGame	"Gå till början av partiet"
::browser::mc::GotoEndOfGame		"Gå till slutet av partiet"
::browser::mc::IncreaseBoardSize	"Förstora brädet"
::browser::mc::DecreaseBoardSize	"Förminska brädet"
::browser::mc::MaximizeBoardSize	"Maximera brädet"
::browser::mc::MinimizeBoardSize	"Minimera brädet"

::browser::mc::GotoGame(first)	"Gå till första partiet"
::browser::mc::GotoGame(last)		"Gå till sista partiet"
::browser::mc::GotoGame(next)		"Goto next game" ;# NEW
::browser::mc::GotoGame(prev)		"Goto previous game" ;# NEW

::browser::mc::LoadGame				"Ladda parti"
::browser::mc::MergeGame			"Sammanfoga parti"

::browser::mc::IllegalMove			"Ogiltigt drag"
::browser::mc::NoCastlingRights	"Rockad ej tillåten"

### overview ###########################################################
::overview::mc::Overview				"Översikt"
::overview::mc::RotateBoard			"Byt sida"
::overview::mc::AcceleratorRotate	"R"

### encoding ###########################################################
::encoding::mc::AutoDetect				"auto-detection"

::encoding::mc::Encoding				"Kodning"
::encoding::mc::Description			"Beskriving"
::encoding::mc::Languages				"Språk (fonter)"
::encoding::mc::UseAutoDetection		"Use Auto-Detection"

::encoding::mc::ChooseEncodingTitle	"Välj kodning"

::encoding::mc::CurrentEncoding		"Aktuell kodning:"
::encoding::mc::DefaultEncoding		"Standardkodning:"
::encoding::mc::SystemEncoding		"Systemkodning:"

### setup ##############################################################
::setup::mc::Chess960Position			"Chess 960 position"
::setup::mc::SymmChess960Position	"Symmetrisk chess 960 position"
::setup::mc::ShuffleChessPosition	"Shuffle chess position"

### setup board ########################################################
::setup::position::mc::SetStartPosition		"Sätt startposition"
::setup::position::mc::UsePreviousPosition	"Använd tidigare position"

::setup::board::mc::SetStartBoard				"Sätt startbord"
::setup::board::mc::SideToMove					"Vid draget"
::setup::board::mc::Castling						"Rockad"
::setup::board::mc::MoveNumber					"Dragnummer"
::setup::board::mc::EnPassantFile				"En passant"
::setup::board::mc::StartPosition				"Startposition"
::setup::board::mc::Fen								"FEN"
::setup::board::mc::Clear							"Rensa"
::setup::board::mc::CopyFen						"Kopiera FEN till urklipp"
::setup::board::mc::Shuffle						"Shuffle..."
::setup::board::mc::StandardPosition			"Standardposition"
::setup::board::mc::Chess960Castling			"Chess 960 rockad"

::setup::board::mc::InvalidFen					"Ogiltigt FEN"
::setup::board::mc::CastlingWithoutRook		"Du har valt att rockad är tillåten men det saknas minst ett torn. Detta är bara möjligt i partier med handikapp. Är du säker att du valt rätt?"
::setup::board::mc::UnsupportedVariant			"Positionen är en startposition men ingen Shuffle Chess position. Är du säker?"

::setup::board::mc::ChangeToFormat(xfen)				"Change to X-Fen format" ;# NEW
::setup::board::mc::ChangeToFormat(shredder)			"Change to Shredder format" ;# NEW

::setup::board::mc::Error(InvalidFen)					"FEN är ogiltigt."
::setup::board::mc::Error(NoWhiteKing)					"Vit kung saknas."
::setup::board::mc::Error(NoBlackKing)					"Svart kung saknas."
::setup::board::mc::Error(DoubleCheck)					"Båda kungar står i schack."
::setup::board::mc::Error(OppositeCheck)				"Spelaren som inte är vid draget står i schack."
::setup::board::mc::Error(TooManyWhitePawns)			"För många vita bönder."
::setup::board::mc::Error(TooManyBlackPawns)			"För många svarta bönder."
::setup::board::mc::Error(TooManyWhitePieces)		"För många vita pjäser."
::setup::board::mc::Error(TooManyBlackPieces)		"För många svarta pjäser."
::setup::board::mc::Error(PawnsOn18)					"Bonde på rad 1 eller 8."
::setup::board::mc::Error(TooManyKings)				"Fler än två kungar."
::setup::board::mc::Error(TooManyWhite)				"För många vita pjäser."
::setup::board::mc::Error(TooManyBlack)				"För många svarta pjäser."
::setup::board::mc::Error(BadCastlingRights)			"Ogiltiga rockadrättigheter."
::setup::board::mc::Error(InvalidCastlingRights)	"Ogiltig tornlinje för rockad."
::setup::board::mc::Error(InvalidCastlingFile)		"Ogiltig rockadlinje."
::setup::board::mc::Error(AmbiguousCastlingFyles)	"För rockad måste entydiga tornlinjer anges. (Möjligtvis är fel linjer angivna.)"
::setup::board::mc::Error(InvalidEnPassant)			"Ogiltig en passant-linje."
::setup::board::mc::Error(MultiPawnCheck)				"Två eller fler bönder ger schack."
::setup::board::mc::Error(TripleCheck)					"Tre eller fler pjäser ger schack."

### import #############################################################
::import::mc::ImportingPgnFile					"Importerar PGN-fil '%s'"
::import::mc::ImportingDatabase					"Importing database '%s'" ;# NEW
::import::mc::Line									"Rad"
::import::mc::Column									"Spalt"
::import::mc::GameNumber							"Parti"
::import::mc::ImportedGames						"%s partier importerade"
::import::mc::NoGamesImported						"Inga partier importerade"
::import::mc::FileIsEmpty							"Filen är kanske tom"
::import::mc::DatabaseImport						"Databas-import"
::import::mc::ImportPgnGame						"Import PGN-parti"
::import::mc::ImportPgnVariation					"Import PGN-variation"
::import::mc::ImportOK								"PGN-text importerad utan fel eller varningar."
::import::mc::ImportAborted						"Import avbruten."
::import::mc::TextIsEmpty							"PGN-text är tom."
::import::mc::AbortImport							"Avbryta PGN-import?"

::import::mc::DifferentEncoding					"Den valda kodningen %src överensstämmer inte med filkodningen %dst."
::import::mc::DifferentEncodingDetails			"Databasen kan därefter inte omkoderas."
::import::mc::CannotDetectFigurineSet			"Kan inte hitta någon passande figuruppsättning."
::import::mc::CheckImportResult					"Kontrollera om den riktiga figuruppsättningen hittats."
::import::mc::CheckImportResultDetail			"In seldom cases the auto-detection fails due to ambiguities."

::import::mc::EnterOrPaste							"Ange eller klistra in ett %s i PGN-format i fönstret ovan.\nFel vid import av %s kommer att visas här."
::import::mc::EnterOrPaste-Game					"parti"
::import::mc::EnterOrPaste-Variation			"variation"

::import::mc::MissingWhitePlayerTag				"Vitspelare saknas"
::import::mc::MissingBlackPlayerTag				"Svartspelare saknas"
::import::mc::MissingPlayerTags					"Spelare saknas"
::import::mc::MissingResult						"Resultat saknas (i slutet av move section)"
::import::mc::MissingResultTag					"Resultat saknas (i tag section)"
::import::mc::InvalidRoundTag						"Ogiltig 'round tag'"
::import::mc::InvalidResultTag					"Ogiltig 'result tag'"
::import::mc::InvalidDateTag						"Ogiltig 'date tag'"
::import::mc::InvalidEventDateTag				"Ogiltig 'event date tag'"
::import::mc::InvalidTimeModeTag					"Ogiltig 'time mode tag'"
::import::mc::InvalidEcoTag						"Ogiltig 'ECO tag'"
::import::mc::InvalidTagName						"Ogiltig 'tag name' (ignored)"
::import::mc::InvalidCountryCode					"Ogiltig landskod"
::import::mc::InvalidRating						"Ogiltigt 'ratingtal'"
::import::mc::InvalidNag							"Ogiltig 'NAG'"
::import::mc::BraceSeenOutsideComment			"\"\}\" seen outisde a comment in game (ignored)"
::import::mc::MissingFen							"No start position for this Shuffle/Chess-960 game; will be interpreted as standard chess" ;# NEW
::import::mc::UnknownEventType					"Okänd tävlingstyp"
::import::mc::UnknownTitle							"Okänd titel(ignorerad)"
::import::mc::UnknownPlayerType					"Okänd spelartyp (ignorerad)"
::import::mc::UnknownSex							"Okänd kön (ignorerad)"
::import::mc::UnknownTermination					"Okänd avbrottsorsak"
::import::mc::UnknownMode							"Okänd modus"
::import::mc::RatingTooHigh						"Ratingtal för högt(ignorerad)"
::import::mc::TooManyNags							"För många NAG's (latter ignored)"
::import::mc::IllegalCastling						"Otillåten rockad"
::import::mc::IllegalMove							"Ogiltigt drag"
::import::mc::CastlingCorrection					"Rockad korrigering"
::import::mc::UnsupportedVariant					"Unsupported chess variant"
::import::mc::UnsupportedCrazyhouseVariant	"Variant Crazyhouse is not yet supported (game skipped)" ;# NEW
::import::mc::DecodingFailed						"Partiet kunde inte avkodas"
::import::mc::ResultDidNotMatchHeaderResult	"Resultatet motsvarar inte resultatrubrik"
::import::mc::ValueTooLong							"Tagvärdet är för lång och kommer att avkortas till 255 tecken"
::import::mc::MaximalErrorCountExceeded		"Fler än maximalt tillåtna fel. Inga fler fel (av tidigare typ) kommer att rapporteras"
::import::mc::MaximalWarningCountExceeded		"Fler än maximalt tillåtna varningar. Inga fler varningar (av tidigare typ) kommer att rapporteras"
::import::mc::InvalidToken							"Ogiltigt tecken"
::import::mc::InvalidMove							"Ogiltigt drag"
::import::mc::UnexpectedSymbol					"Oväntad symbol"
::import::mc::UnexpectedEndOfInput				"Oväntad end of input"
::import::mc::UnexpectedResultToken				"Oväntad resultattecken"
::import::mc::UnexpectedTag						"Oväntad tag inuti parti"
::import::mc::UnexpectedEndOfGame				"Oväntad slut av parti (saknar resultat)"
::import::mc::TagNameExpected						"Syntaxfel: Tag name expected"
::import::mc::TagValueExpected					"Syntaxfel: Tag value expected"
::import::mc::InvalidFen							"Ogiltig FEN"
::import::mc::UnterminatedString					"Obestämd sträng"
::import::mc::UnterminatedVariation				"Obestämd variation"
::import::mc::TooManyGames							"För många partier i databasen (avbrott)"
::import::mc::GameTooLong							"Partiet för långt (utelämnat)"
::import::mc::FileSizeExceeded					"Maximala filstorleken (2GB) kommer att överskridas (avbrott)"
::import::mc::TooManyPlayerNames					"För många spelarnamn i databasen (avbrott)"
::import::mc::TooManyEventNames					"För många tävlingsnamn i databasen (avbrott)"
::import::mc::TooManySiteNames					"För många platsnamn i databasen (avbrott)"
::import::mc::TooManyRoundNames					"För många rondnamn i databasen"
::import::mc::TooManyAnnotatorNames				"För många kommentatornamn i databasen (avbrott)"
::import::mc::TooManySourceNames					"För många källnamn i databasen (avbrott)"
::import::mc::SeemsNotToBePgnText				"Det här är ingen PGN-text."
::import::mc::AbortedDueToInternalError		"Avbrott på grund av internt fel."
::import::mc::AbortedDueToIoError				"Aborted due to an read/write error" ;# NEW
::import::mc::UserHasInterrupted					"User has interrupted" ;# NEW

### export #############################################################
::export::mc::FileSelection				"&File Selection"
::export::mc::OptionsSetup					"&Options"
::export::mc::PageSetup						"&Page Setup"
::export::mc::DiagramSetup					"&Diagram Setup"
::export::mc::StyleSetup					"Sty&le"
::export::mc::EncodingSetup				"&Encoding"
::export::mc::TagsSetup						"&Tags"
::export::mc::NotationSetup				"&Notation"
::export::mc::AnnotationSetup				"&Annotation"
::export::mc::CommentsSetup				"&Comments"

::export::mc::Visibility					"Synlighet"
::export::mc::HideDiagrams					"Dölj diagram"
::export::mc::AllFromWhitePersp			"Allt från vits perspektiv"
::export::mc::AllFromBlackPersp			"Allt från svarts perspektiv"
::export::mc::ShowCoordinates				"Visa koordinater"
::export::mc::ShowSideToMove				"Visa vem som är vid draget"
::export::mc::ShowArrows					"Visa pilar"
::export::mc::ShowMarkers					"Visa markeringar"
::export::mc::Layout							"Layout"
::export::mc::PostscriptSpecials			"Postscript-specialiteter"
::export::mc::BoardSize						"Brädstorlek"

::export::mc::Short							"Kort"
::export::mc::Long							"Lång"
::export::mc::Algebraic						"Algebraisk"
::export::mc::Correspondence				"Korrespondens"
::export::mc::Telegraphic					"Telegrafisk"
::export::mc::FontHandling					"Fonthantering"
::export::mc::DiagramStyle					"Diagramstil"
::export::mc::UseImagesForDiagram		"Använd schabloner för diagramgenerering"
::export::mc::EmebedTruetypeFonts		"Embed TrueType fonts"
::export::mc::UseBuiltinFonts				"Använd inbyggda fonter"
::export::mc::SelectExportedTags			"Val av exporterade fonter"
::export::mc::ExcludeAllTags				"Uteslut alla tags"
::export::mc::IncludeAllTags				"Inkludera alla tags"
::export::mc::ExtraTags						"Alla andra extra tags"
::export::mc::NoComments					"Ingen kommentar"
::export::mc::AllLanguages					"Alla språk"
::export::mc::Significant					"Signifikant"
::export::mc::LanguageSelection			"Val av språk"
::export::mc::MapTo							"Avbilda till"
::export::mc::MapNagsToComment			"Map annotations to comments"
::export::mc::UnusualAnnotation			"Unusual annotations"
::export::mc::AllAnnotation				"All annotations"
::export::mc::UseColumnStyle				"Use column style"
::export::mc::MainlineStyle				"Main Line Style"
::export::mc::HideVariations				"Dölj varianter"

::export::mc::PdfFiles						"PDF-filer"
::export::mc::HtmlFiles						"HTML-filer"
::export::mc::TeXFiles						"LaTeX-filer"

::export::mc::ExportDatabase				"Exportera databas"
::export::mc::ExportDatabaseTitle		"Exportera databas '%s'"
::export::mc::ExportingDatabase			"Exporterar '%s' till filen '%s'"
::export::mc::Export							"Export"
::export::mc::NoGamesCopied				"No games exported." ;# NEW
::export::mc::ExportedGames				"%s partier exporterade"
::export::mc::NoGamesForExport			"Inga partier att exportera."
::export::mc::ResetDefaults				"Återställ till standardvärden"
::export::mc::UnsupportedEncoding		"Kan inte använda kodning %s för PDF-dokument. Välj en alternativ kodning."
::export::mc::DatabaseIsOpen				"The destination database '%s' is open, this means that the destination database will be emptied before the export is starting. Export anyway?" ;# NEW
::export::mc::DatabaseIsOpenDetail		"If you want to append instead you should use a Drag&Drop operation inside the database switcher." ;# NEW
::export::mc::ExportGamesFromTo			"Export games from '%src' to '%dst'" ;# NEW

::export::mc::BasicStyle					"Grundstil"
::export::mc::GameInfo						"Partiinfo"
::export::mc::GameText						"Partitext"
::export::mc::Moves							"Drag"
::export::mc::MainLine						"Huvudvariant"
::export::mc::Variation						"Variant"
::export::mc::Subvariation					"Sidovariant"
::export::mc::Figurines						"Figuruppsättning"
::export::mc::Hyphenation					"Avstavning"
::export::mc::None							"(ingen)"
::export::mc::Symbols						"Symboler"
::export::mc::Comments						"Kommentarer"
::export::mc::Result							"Resultat"
::export::mc::Diagram						"Diagram"
::export::mc::ColumnStyle					"Spaltformatering"

::export::mc::Paper							"Papper"
::export::mc::Orientation					"Orientering"
::export::mc::Margin							"Marginaler"
::export::mc::Format							"Format"
::export::mc::Size							"Storlek"
::export::mc::Custom							"Anpassad"
::export::mc::Potrait						"Stående"
::export::mc::Landscape						"Liggande"
::export::mc::Justification				"Justering"
::export::mc::Even							"Vänster och höger"
::export::mc::Columns						"Spalter"
::export::mc::One								"En"
::export::mc::Two								"Två"

::export::mc::DocumentStyle				"Dokumentstil"
::export::mc::Article						"Artikel"
::export::mc::Report							"Rapport"
::export::mc::Book							"Bok"

::export::mc::FormatName(scidb)			"Scidb"
::export::mc::FormatName(scid)			"Scid"
::export::mc::FormatName(pgn)				"PGN"
::export::mc::FormatName(pdf)				"PDF"
::export::mc::FormatName(html)			"HTML"
::export::mc::FormatName(tex)				"LaTeX"
::export::mc::FormatName(ps)				"Postscript"

::export::mc::Option(pgn,include_varations)						"Exportera varianter"
::export::mc::Option(pgn,include_comments)						"Exportera kommentarer"
::export::mc::Option(pgn,include_moveinfo)						"Exportera draginformationer (som kommentarer)"
::export::mc::Option(pgn,include_marks)							"Exportera markeringar (som kommentarer)"
::export::mc::Option(pgn,use_scidb_import_format)				"Använd Scidb-importformat"
::export::mc::Option(pgn,use_chessbase_format)					"Använd ChessBase-format"
::export::mc::Option(pgn,include_ply_count_tag)					"Skriv tag 'PlyCount'"
::export::mc::Option(pgn,include_termination_tag)				"Skriv tag 'Termination'"
::export::mc::Option(pgn,include_mode_tag)						"Skriv tag 'Mode'"
::export::mc::Option(pgn,include_opening_tag)					"Skriv tags 'Opening', 'Variation', 'Subvariation'"
::export::mc::Option(pgn,include_setup_tag)						"Skriv tag 'Setup' (om nödvändigt)"
::export::mc::Option(pgn,include_variant_tag)					"Skriv tag 'Variant' (om nödvändigt)"
::export::mc::Option(pgn,include_position_tag)					"Skriv tag 'Position' (om nödvändigt)"
::export::mc::Option(pgn,include_time_mode_tag)					"Skriv tag 'TimeMode' (om nödvändigt)"
::export::mc::Option(pgn,exclude_extra_tags)						"Uteslut extra tags"
::export::mc::Option(pgn,indent_variations)						"Indrag för varianter"
::export::mc::Option(pgn,indent_comments)							"Indrag för kommentarer"
::export::mc::Option(pgn,column_style)								"Spaltformatering (ett drag per rad)"
::export::mc::Option(pgn,symbolic_annotation_style)			"Schacktecken(!, !?)"
::export::mc::Option(pgn,extended_symbolic_style)				"Utökade schacktecken(+=, +/-)"
::export::mc::Option(pgn,convert_null_moves)						"Skriv nolldrag som kommentarer"
::export::mc::Option(pgn,space_after_move_number)				"Infoga mellanslag efter dragnummer"
::export::mc::Option(pgn,shredder_fen)								"Använd Shredder-FEN (standard är X-FEN)"
::export::mc::Option(pgn,convert_lost_result_to_comment)		"Skriv kommentar för resultat '0-0'"
::export::mc::Option(pgn,append_mode_to_event_type)			"Lägg till modus efter tävlingstyp"
::export::mc::Option(pgn,comment_to_html)							"Skriv kommentar i HTML-format"
::export::mc::Option(pgn,exclude_games_with_illegal_moves)	"Uteslut partier med ogiltiga drag"
::export::mc::Option(pgn,use_utf8_encoding)						"Use UTF-8 encoding" ;# NEW

### notation ###########################################################
::notation::mc::Notation		"Notation"

::notation::mc::MoveForm(alg)	"Algebraisk"
::notation::mc::MoveForm(san)	"Kort algebraisk"
::notation::mc::MoveForm(lan)	"Long algebraisk"
::notation::mc::MoveForm(eng)	"Engelskt"
::notation::mc::MoveForm(cor)	"Korrespondens"
::notation::mc::MoveForm(tel)	"Telegrafisk"

### figurine ###########################################################
::figurines::mc::Figurines	"Figuruppsättning"
::figurines::mc::Graphic	"Grafisk"
::figurines::mc::User		"User" ;# NEW meaning is "user defined"

### save/replace #######################################################
::dialog::save::mc::SaveGame						"Spara partiet"
::dialog::save::mc::ReplaceGame					"Ersätt partiet"
::dialog::save::mc::EditCharacteristics		"Redigera egenskaper"
	
::dialog::save::mc::GameData						"Partidata"
::dialog::save::mc::Event							"Tävling"

::dialog::save::mc::MatchesExtraTags			"Matches / Extra Tags"
::dialog::save::mc::PressToSelect				"Tryck Ctrl+0 till Ctrl+9 (eller vänster musknapp) för att välja"
::dialog::save::mc::PressForWhole				"Tryck Alt-0 till Alt-9 (eller mellersta musknappen) för helt dataset"
::dialog::save::mc::EditTags						"Bearbeta tags"
::dialog::save::mc::RemoveThisTag				"Radera tag '%s'?"
::dialog::save::mc::TagAlreadyExists			"Tagnamnet '%s' finns redan."
::dialog::save::mc::TagRemoved					"Extra tag '%s' (aktuellt värde: '%s') kommer att raderas."
::dialog::save::mc::TagNameIsReserved			"Tagnamnet '%s' är reserverat."
::dialog::save::mc::Locked							"Spärrad"
::dialog::save::mc::OtherTag						"Fler tags"
::dialog::save::mc::NewTag							"Ny tag"
::dialog::save::mc::RemoveTag						"Radera tag"
::dialog::save::mc::SetToGameDate				"Ange partidatum"
::dialog::save::mc::SaveGameFailed				"Partiet kunde inte sparas."
::dialog::save::mc::SaveGameFailedDetail		"Se log för detaljer."
::dialog::save::mc::SavingGameLogInfo			"Sparar partiet (%vit - %svart, %tävling) i databasen '%base'"
::dialog::save::mc::CurrentBaseIsReadonly		"Aktuell databas '%s' är skrivskyddad."
::dialog::save::mc::CurrentGameHasTrialMode	"Aktuellt parti befinner sig i teststadiet och kan inte sparas."

::dialog::save::mc::LocalName						"&Lokalt namn"
::dialog::save::mc::EnglishName					"E&ngelskt namn"
::dialog::save::mc::ShowRatingType				"Visa &rating"
::dialog::save::mc::EcoCode						"&ECO-code"
::dialog::save::mc::Matches						"&Matches"
::dialog::save::mc::Tags							"&Tags"

::dialog::save::mc::Label(name)					"Namn"
::dialog::save::mc::Label(fideID)				"Fide-ID"
::dialog::save::mc::Label(value)					"Värde"
::dialog::save::mc::Label(title)					"Titel"
::dialog::save::mc::Label(rating)				"Rating"
::dialog::save::mc::Label(federation)			"Nation"
::dialog::save::mc::Label(country)				"Land"
::dialog::save::mc::Label(eventType)			"Typ"
::dialog::save::mc::Label(sex)					"Kön/Typ"
::dialog::save::mc::Label(date)					"Datum"
::dialog::save::mc::Label(eventDate)			"Tävlingsdatum"
::dialog::save::mc::Label(round)					"Rond"
::dialog::save::mc::Label(result)				"Resultat"
::dialog::save::mc::Label(termination)			"Avslutning"
::dialog::save::mc::Label(annotator)			"Kommentator"
::dialog::save::mc::Label(site)					"Plats"
::dialog::save::mc::Label(eventMode)			"Modus"
::dialog::save::mc::Label(timeMode)				"Tidsmodus"
::dialog::save::mc::Label(frequency)			"Frekvens"
::dialog::save::mc::Label(score)					"Second rating"

::dialog::save::mc::GameBase						"Partidatabas"
::dialog::save::mc::PlayerBase					"Spelardatabas"
::dialog::save::mc::EventBase						"Tävlingsdatabas"
::dialog::save::mc::SiteBase						"Platsdatabas"
::dialog::save::mc::AnnotatorBase				"Kommentatordatabas"
::dialog::save::mc::History						"Historik"

::dialog::save::mc::InvalidEntry					"'%s' är ingen giltig uppgift."
::dialog::save::mc::InvalidRoundEntry			"'%s' är ingen giltig ronduppgift."
::dialog::save::mc::InvalidRoundEntryDetail	"Giltiga ronduppgifter är '4' eller '6.1'. Noll som rondnummer är inte tillåten."
::dialog::save::mc::RoundIsTooHigh				"Rondnumret ska vara lägre än 256."
::dialog::save::mc::SubroundIsTooHigh			"Underrondnumret ska vara lägre än 256."
::dialog::save::mc::ImplausibleDate				"Datum för parti '%s' är tidigare än datum för tävling '%s'."
::dialog::save::mc::InvalidTagName				"Ogiltigt tagnamn '%s' (syntaxfel)."
::dialog::save::mc::Field							"Fält '%s': "
::dialog::save::mc::ExtraTag						"Extra tag '%s': "
::dialog::save::mc::InvalidNetworkAddress		"Ogiltig nätverksadress '%s'."
::dialog::save::mc::InvalidCountryCode			"Ogiltig landscode '%s'."
::dialog::save::mc::InvalidEventRounds			"Ogiltigt antal tävlingsronder '%s' (ska vara positivt heltal)."
::dialog::save::mc::InvalidPlyCount				"Ogiltigt antal drag '%s' (ska vara positivt heltal)."
::dialog::save::mc::IncorrectPlyCount			"Fel antal drag '%s' (rätt antal drag är %s)."
::dialog::save::mc::InvalidTimeControl			"Ogiltig tidskontrolluppgift i '%s'."
::dialog::save::mc::InvalidDate					"Ogiltigt datum '%s'."
::dialog::save::mc::InvalidYear					"Ogiltigt år '%s'."
::dialog::save::mc::InvalidMonth					"Ogiltig månad '%s'."
::dialog::save::mc::InvalidDay					"Ogiltig dag '%s'."
::dialog::save::mc::MissingYear					"Uppgift om år saknas."
::dialog::save::mc::MissingMonth					"Uppgift om månad saknas."
::dialog::save::mc::StringTooLong				"Tag %tag%: sträng '%value%' är för lång och kommer att förkortas till '%trunc%'."
::dialog::save::mc::InvalidEventDate			"Kan inte acceptera angivet tävlingsdatum: Skillnaden mellan året för partiet och året för tävlingen ska vara mindre än 4 (begränsning av Scid-databasformatet)."
::dialog::save::mc::TagIsEmpty					"Tag '%s' är tom (kommer att utsorteras)."

### gamehistory ########################################################
::game::history::mc::GameHistory		"Partihistoria"

### game ###############################################################
::game::mc::CloseDatabase					"Stäng databasen"
::game::mc::CloseAllGames					"Stäng alla öppna partier i databas '%s'?"
::game::mc::SomeGamesAreModified			"Några partier i databas '%s' har ändrats. Vill du stänga dem ändå?"
::game::mc::AllSlotsOccupied				"All game slots are occupied."
::game::mc::ReleaseOneGame					"Please release one of the games before loading a new one."
::game::mc::GameAlreadyOpen				"Partiet är redan öppnat men har ändrats. Discard modified version of this game?"
::game::mc::GameAlreadyOpenDetail		"'%s' kommer att öppna ett nytt parti."
::game::mc::GameHasChanged					"Parti %s har ändrats."
::game::mc::GameHasChangedDetail			"Probably this is not the expected game due to database changes."
::game::mc::CorruptedHeader				"Corrupted header in recovery file '%s'."
::game::mc::RenamedFile						"Filen har döpts om till '%s.bak'."
::game::mc::CannotOpen						"Kan inte öppna återställningfilen '%s'."
::game::mc::GameRestored					"Ett parti återställt från senaste session."
::game::mc::GamesRestored					"%s partier återställda från senaste session."
::game::mc::OldGameRestored				"Ett parti återställt."
::game::mc::OldGamesRestored				"%s partier återställda."
::game::mc::ErrorInRecoveryFile			"Fel i återställningsfilen '%s'"
::game::mc::Recovery							"Återställning"
::game::mc::UnsavedGames					"Det finns partiändringar som inte sparats."
::game::mc::DiscardChanges					"'%s' kommer att ta bort alla ändringar."
::game::mc::ShouldRestoreGame				"Ska detta parti återställas under nästa session?"
::game::mc::ShouldRestoreGames			"Ska dessa partier återställas under nästa session?"
::game::mc::NewGame							"Nytt parti"
::game::mc::NewGames							"Nya partier"
::game::mc::Created							"skapade"
::game::mc::ClearHistory					"Töm historik"
::game::mc::RemoveSelectedGame			"Ta bort valt parti från historien"
::game::mc::GameDataCorrupted				"Partidata är skadade."
::game::mc::GameDecodingFailed			"Partiet kunde inte avkodas."
::game::mc::GameDecodingChanged			"The database is opened with character set '%base%', but this game seems to be encoded with character set '%game%', therefore this game is loaded with the detected character set." ;# NEW
::game::mc::GameDecodingChangedDetail	"Probably you have opened the database with the wrong character set. Note that the automatic detection of the character set is limited." ;# NEW

### languagebox ########################################################
::languagebox::mc::AllLanguages	"Alla språk"
::languagebox::mc::None				"Inget"

### datebox ############################################################
::widget::datebox::mc::Today		"Idag"
::widget::datebox::mc::Calendar	"Kalender..."
::widget::datebox::mc::Year		"År"
::widget::datebox::mc::Month		"Månad"
::widget::datebox::mc::Day			"Dag"

### genderbox ##########################################################
::genderbox::mc::Gender(m) "Man"
::genderbox::mc::Gender(f) "Kvinna"
::genderbox::mc::Gender(c) "Dator"

### terminationbox #####################################################
::terminationbox::mc::Normal							"Normalt"
::terminationbox::mc::Unplayed						"Inte spelat"
::terminationbox::mc::Abandoned						"Avbrutet"
::terminationbox::mc::Adjudication					"Avdömt"
::terminationbox::mc::Death							"Död"
::terminationbox::mc::Emergency						"Nödsituation"
::terminationbox::mc::RulesInfraction				"Regelbrott"
::terminationbox::mc::TimeForfeit					"Tidsöverskridning"
::terminationbox::mc::Unterminated					"Ej färdigspelat"

::terminationbox::mc::State(Mate)					"%s is checkmate" ;# NEW
::terminationbox::mc::State(Stalemate)				"%s is stalemate" ;# NEW

::terminationbox::mc::Result(1-0)					"White resigned" ;# NEW
::terminationbox::mc::Result(0-1)					"Black resigned" ;# NEW
::terminationbox::mc::Result(0-0)					"Declared lost for both players" ;# NEW
::terminationbox::mc::Result(1/2-1/2)				"Draw agreed" ;# NEW

::terminationbox::mc::Reason(Unplayed)				"Game is unplayed" ;# NEW
::terminationbox::mc::Reason(Abandoned)			"Game is abandoned" ;# NEW
::terminationbox::mc::Reason(Adjudication)		"Adjudication" ;# NEW
::terminationbox::mc::Reason(Death)					"" ;# NEW
::terminationbox::mc::Reason(Emergency)			"Abandoned due to an emergency" ;# NEW
::terminationbox::mc::Reason(RulesInfraction)	"Decided due to a rules infraction" ;# NEW
::terminationbox::mc::Reason(TimeForfeit)			"%s forfeits on time" ;# NEW
::terminationbox::mc::Reason(TimeForfeit,both)	"Both players forfeits on time" ;# NEW
::terminationbox::mc::Reason(Unterminated)		"Unterminated" ;# NEW

### eventmodebox #######################################################
::eventmodebox::mc::OTB				"Vid bordet"
::eventmodebox::mc::PM				"Korrespondens"
::eventmodebox::mc::EM				"E-mail"
::eventmodebox::mc::ICS				"Internet Chess Server"
::eventmodebox::mc::TC				"Telekommunikation"
::eventmodebox::mc::Analysis		"Analys"
::eventmodebox::mc::Composition	"Komposition"

### eventtypebox #######################################################
::eventtypebox::mc::Type(game)	"Fristående parti"
::eventtypebox::mc::Type(match)	"Tävlingsparti"
::eventtypebox::mc::Type(tourn)	"Berger"
::eventtypebox::mc::Type(swiss)	"Schweizerturnering"
::eventtypebox::mc::Type(team)	"Lagtävling"
::eventtypebox::mc::Type(k.o.)	"Utslagstävling"
::eventtypebox::mc::Type(simul)	"Simultantävling"
::eventtypebox::mc::Type(schev)	"Scheveningen-System Tournament"  

### timemodebox ########################################################
::timemodebox::mc::Mode(normal)	"Normal"
::timemodebox::mc::Mode(rapid)	"Snabb"
::timemodebox::mc::Mode(blitz)	"Blixt"
::timemodebox::mc::Mode(bullet)	"Bullet"
::timemodebox::mc::Mode(corr)		"Korrespondens"

### help ###############################################################
::help::mc::Contents					"&Innehåll"
::help::mc::Index						"&Index"
::help::mc::Search					"&Sök"

::help::mc::Help						"Hjälp"
::help::mc::MatchEntireWord		"Matcha hela ord"
::help::mc::MatchCase				"Matcha gemener/versaler"
::help::mc::TitleOnly				"Sök endast bland titlar"
::help::mc::CurrentPageOnly		"Sök endast på aktuell sida"
::help::mc::GoBack					"Gå bakåt en sida"
::help::mc::GoForward				"Gå framåt en sida"
::help::mc::GotoPage					"Gå till sida '%s'"
::help::mc::ExpandAllItems			"Expand all items"
::help::mc::CollapseAllItems		"Collapse all items"
::help::mc::SelectLanguage			"Välj språk"
::help::mc::NoHelpAvailable		"Det finns inga hjälpfiler på engelska.\nVälj ett annat språk\nför hjälpdialogen."
::help::mc::NoHelpAvailableAtAll	"Inga hjälpfiler finns för detta ämne."
::help::mc::KeepLanguage			"Använd samma språk %s för kommande sessioner?"
::help::mc::ParserError				"Fel vid parsning av fil %s."
::help::mc::NoMatch					"Ingen träff"
::help::mc::MaxmimumExceeded		"För många träffar på somliga sidor."
::help::mc::OnlyFirstMatches		"Endast de första %s träffar per sida kommer att visas."
::help::mc::HideIndex				"Dölj index"
::help::mc::ShowIndex				"Visa index"

::help::mc::FileNotFound			"Hittar ej filen."
::help::mc::CantFindFile			"Kan inte hitta filen på %s."
::help::mc::IncompleteHelpFiles	"Det verkar som om hjälpfilerna är fortfarande ofullständiga. Vi beklagar."
::help::mc::ProbablyTheHelp		"Kanske kan hjälpsidan på ett annat språk vara ett alternativ för dig."
::help::mc::PageNotAvailable		"Denna sida är inte tillgänglig"

::help::mc::Overview					"Översikt"

### crosstable #########################################################
::crosstable::mc::TournamentTable		"Turneringstabell"
::crosstable::mc::AverageRating			"Genomsnittsranking"
::crosstable::mc::Category					"Kategori"
::crosstable::mc::Games						"Partier"
::crosstable::mc::Game						"Parti"

::crosstable::mc::ScoringSystem			"Poängsystem"
::crosstable::mc::Tiebreak					"Tie-Break"
::crosstable::mc::Settings					"Inställningar"
::crosstable::mc::RevertToStart			"Återgå till de ursprungliga värdena"
::crosstable::mc::UpdateDisplay			"Uppdatera displayen"

::crosstable::mc::Traditional				"Traditionellt"
::crosstable::mc::Bilbao					"Bilbao"

::crosstable::mc::None						"None"
::crosstable::mc::Buchholz					"Buchholz"
::crosstable::mc::MedianBuchholz			"Median-Buchholz"
::crosstable::mc::ModifiedMedianBuchholz "Mod. Median-Buchholz"
::crosstable::mc::RefinedBuchholz		"Refined Buchholz"
::crosstable::mc::SonnebornBerger		"Sonneborn-Berger"
::crosstable::mc::Progressive				"Progressive Score"
::crosstable::mc::KoyaSystem				"Koya System"
::crosstable::mc::GamesWon					"Antal vinstpartier"
::crosstable::mc::GamesWonWithBlack		"Antal vinstpartier med svart"
::crosstable::mc::ParticularResult		"Particular Result"
::crosstable::mc::TraditionalScoring	"Traditional Scoring"

::crosstable::mc::Crosstable				"Korstabell"
::crosstable::mc::Scheveningen			"Scheveningen"
::crosstable::mc::Swiss						"Schweitzersystem"
::crosstable::mc::Match						"Match"
::crosstable::mc::Knockout					"Knockout"
::crosstable::mc::RankingList				"Rankinglista"

::crosstable::mc::Order						"Order"
::crosstable::mc::Type						"Table Type"
::crosstable::mc::Score						"Score"
::crosstable::mc::Alphabetical			"Alfabetisk"
::crosstable::mc::Rating					"Rating"
::crosstable::mc::Federation				"Nation"

::crosstable::mc::Debugging				"Debugging"
::crosstable::mc::Display					"Display"
::crosstable::mc::Style						"Stil"
::crosstable::mc::Spacing					"Radavstånd"
::crosstable::mc::Padding					"Padding"
::crosstable::mc::ShowLog					"Visa log"
::crosstable::mc::ShowHtml					"Visa HTML"
::crosstable::mc::ShowRating				"Rating"
::crosstable::mc::ShowPerformance		"Prestation"
::crosstable::mc::ShowWinDrawLoss		"Vinst/Remi/Förlust"
::crosstable::mc::ShowTiebreak			"Tiebreak"
::crosstable::mc::ShowOpponent			"Motståndare (som Tooltip)"
::crosstable::mc::KnockoutStyle			"Knockout Table Style"
::crosstable::mc::Pyramid					"Pyramid"
::crosstable::mc::Triangle					"Trekant"

::crosstable::mc::CrosstableLimit		"Korstabellens maxantal av %d spelare kommer att överskridas."
::crosstable::mc::CrosstableLimitDetail "'%s' väljer ett annat tabellformat."

### info ###############################################################
::info::mc::InfoTitle			"Om %s"
::info::mc::Info					"Info"
::info::mc::About					"Om"
::info::mc::Contributions		"Bidrag"
::info::mc::License				"Licens"
::info::mc::Localization		"Localization"
::info::mc::Testing				"Testing"
::info::mc::References			"Referenser"
::info::mc::System				"System"
::info::mc::FontDesign			"Design av schackfonter"
::info::mc::ChessPieceDesign	"Design av schackpjäser"
::info::mc::BoardThemeDesign	"Design av schackbräden"
::info::mc::FlagsDesign			"Design av miniaturflaggor"
::info::mc::IconDesign			"Design av ikoner"
::info::mc::Development			"Development" ;# NEW
::info::mc::Programming			"Programming" ;# NEW
::info::mc::Head					"Head" ;# NEW

::info::mc::Version				"Version"
::info::mc::Distributed			"Det här programmet distribueras enligt bestämmelserna i GNU General Public License."
::info::mc::Inspired				"Scidb bygger på Scid 3.6.1, copyright \u00A9 1999-2003 by Shane Hudson."
::info::mc::SpecialThanks		"Särskilt tack till Shane Hudson för ett fantastiska jobb. Hans insatser är grunden för detta program."

### comment ############################################################
::comment::mc::CommentBeforeMove		"Kommentar före draget"
::comment::mc::CommentAfterMove		"Kommentar efter draget"
::comment::mc::PrecedingComment		"Föregående kommentar"
::comment::mc::TrailingComment		"Efterföljande kommentar"
::comment::mc::Language					"Språk"
::comment::mc::AddLanguage				"Lägg till språk..."
::comment::mc::SwitchLanguage			"Byt språk"
::comment::mc::FormatText				"Formatera text"
::comment::mc::CopyText					"Kopiera text till"
::comment::mc::OverwriteContent		"Ersätta aktuellt innehåll?"
::comment::mc::AppendContent			"Ifall \"nej\" kommer texten att läggas till."

::comment::mc::LanguageSelection		"Val av språk"
::comment::mc::Formatting				"Formaterar"

::comment::mc::Bold						"Fet"
::comment::mc::Italic					"Kursivt"
::comment::mc::Underline				"Understruket"

::comment::mc::InsertSymbol			"&Infoga symbol..."
::comment::mc::MiscellaneousSymbols	"Diverse symboler"
::comment::mc::Figurine					"Figur"

### annotation #########################################################
::annotation::mc::AnnotationEditor					"Kommentarer"
::annotation::mc::TooManyNags							"För många kommentarer (den sista ignorerades)."
::annotation::mc::TooManyNagsDetail					"Maximalt %d kommentarer för varje halvdrag."

::annotation::mc::PrefixedCommentaries				"Kommentarer framför"
::annotation::mc::MoveAssesments						"Dragomdömen"
::annotation::mc::PositionalAssessments			"Positionella omdömen"
::annotation::mc::TimePressureCommentaries		"Tidsnödskommentarer"
::annotation::mc::AdditionalCommentaries			"Fler kommentarer"
::annotation::mc::ChessBaseCommentaries			"ChessBase-kommentarer"

### marks ##############################################################
::marks::mc::MarksPalette			"Markeringar - Palett"

### move ###############################################################
::move::mc::Action(replace)		"Ersätt drag"
::move::mc::Action(variation)		"Lägg till ny variant"
::move::mc::Action(mainline)		"Ny huvudvariant"
::move::mc::Action(trial)			"Försöksvariant"
::move::mc::Action(exchange)		"Byt drag"
::move::mc::Action(append)			"Append move" ;# NEW
::move::mc::Action(load)			"Load first game with this continuation" ;# NEW

::move::mc::GameWillBeTruncated	"Partiet kommer att avkortas. Fortsätta med '%s'?"

### log ################################################################
::log::mc::LogTitle		"Log"
::log::mc::Warning		"Varning"
::log::mc::Error			"Fel"
::log::mc::Information	"Info"

### titlebox ############################################################
::titlebox::mc::Title(GM)		"Stormästare (FIDE)"
::titlebox::mc::Title(IM)		"Internationell mästare (FIDE)"
::titlebox::mc::Title(FM)		"Fide-mästare (FIDE)"
::titlebox::mc::Title(CM)		"Candidate Master (FIDE)"
::titlebox::mc::Title(WGM)		"Woman Grandmaster (FIDE)"
::titlebox::mc::Title(WIM)		"Woman International Master (FIDE)"
::titlebox::mc::Title(WFM)		"Woman Fide Master (FIDE)"
::titlebox::mc::Title(WCM)		"Woman Candidate Master (FIDE)"
::titlebox::mc::Title(HGM)		"Honorary Grandmaster (FIDE)"
::titlebox::mc::Title(NM)		"National Master (USCF)"
::titlebox::mc::Title(SM)		"Senior Master (USCF)"
::titlebox::mc::Title(LM)		"Life Master (USCF)"
::titlebox::mc::Title(CGM)		"Correspondence Grandmaster (ICCF)"
::titlebox::mc::Title(CIM)		"Correspondence International Master (ICCF)"
::titlebox::mc::Title(CLGM)	"Correspondence Lady Grandmaster (ICCF)"
::titlebox::mc::Title(CILM)	"Correspondence Lady International Master (ICCF)"
::titlebox::mc::Title(CSIM)	"Correspondence Senior International Master (ICCF)"

### messagebox #########################################################
::dialog::mc::Ok				"&OK"
::dialog::mc::Cancel			"&Avbryt"
::dialog::mc::Yes				"&Ja"
::dialog::mc::No				"&Nej"
::dialog::mc::Retry			"&Försök igen"
::dialog::mc::Abort			"&Avbryt"
::dialog::mc::Ignore			"&Ignorera"
::dialog::mc::Continue		"Forts&ätt"

::dialog::mc::Error			"Fel"
::dialog::mc::Warning		"Varning"
::dialog::mc::Information	"Information"
::dialog::mc::Question		"Bekräfta"

::dialog::mc::DontAskAgain	"Fråga inte fler gånger"

### web ################################################################
::web::mc::CannotFindBrowser			"Det gick inte att hitta en passande webbrowser."
::web::mc::CannotFindBrowserDetail	"Sätt omgivningsvariabeln BROWSER till den önskade browsern."

### colormenu ##########################################################
::colormenu::mc::BaseColor			"Grundfärg"
::colormenu::mc::UserColor			"Användarfärg"
::colormenu::mc::UsedColor			"Använd färg"
::colormenu::mc::RecentColor		"Senaste färg"
::colormenu::mc::Texture			"Texture"
::colormenu::mc::OpenColorDialog	"Öppna färgdialogen"
::colormenu::mc::EraseColor		"Ta bort färg"
::colormenu::mc::Close				"Stäng"

### table ##############################################################
::table::mc::Ok							"&Ok"
::table::mc::Cancel						"&Avbryt"
::table::mc::Column						"Spalt"
::table::mc::Table						"Tabell"
::table::mc::Configure					"Konfigurera"
::table::mc::Hide							"Dölj"
::table::mc::ShowColumn					"Visa spalt"
::table::mc::Foreground					"Förgrund"
::table::mc::Background					"Bakgrund"
::table::mc::DisabledForeground		"Borttagen förgrund"
::table::mc::SelectionForeground		"Val av förgrund"
::table::mc::SelectionBackground		"Val av bakgrund"
::table::mc::HighlightColor			"Markeringsfärg"
::table::mc::Stripes						"Streck"
::table::mc::MinWidth					"Minimal bredd"
::table::mc::MaxWidth					"Maximal bredd"
::table::mc::Separator					"Separator"
::table::mc::AutoStretchColumn		"Auto stretch column"
::table::mc::FillColumn					"- Fyllnadsspalt -"
::table::mc::Preview						"Förhandsgranskning"
::table::mc::OptimizeColumn			"Optimera spaltbredden"
::table::mc::OptimizeColumns			"Optimera alla spalter"
::table::mc::FitColumnWidth			"Anpassa spaltbredden"
::table::mc::FitColumns					"Anpassa alla spalter"
::table::mc::ExpandColumn				"Expand column width" ;# NEW
::table::mc::SqueezeColumns			"Tryck ihop alla spalter"
::table::mc::AccelFitColumns			"Ctrl+,"
::table::mc::AccelOptimizeColumns	"Ctrl+."
::table::mc::AccelSqueezeColumns		"Ctrl+#"

### fileselectionbox ###################################################
::dialog::fsbox::mc::ScidbDatabase			"Scidb databas"
::dialog::fsbox::mc::ScidDatabase			"Scid databas"
::dialog::fsbox::mc::ChessBaseDatabase		"ChessBase databas"
::dialog::fsbox::mc::PortableGameFile		"Flyttbar partifil"
::dialog::fsbox::mc::ZipArchive				"ZIP arkiv"
::dialog::fsbox::mc::ScidbArchive			"Scidb arkiv"
::dialog::fsbox::mc::PortableDocumentFile	"Flyttbar dokumentfil"
::dialog::fsbox::mc::HypertextFile			"Hypertext fil"
::dialog::fsbox::mc::TypesettingFile		"Typesetting File"
::dialog::fsbox::mc::ImageFile				"Image File" ;# NEW
::dialog::fsbox::mc::TextFile					"Text File" ;# NEW
::dialog::fsbox::mc::BinaryFile				"Bin�ry File" ;# NEW
::dialog::fsbox::mc::ShellScript				"Shell Script" ;# NEW
::dialog::fsbox::mc::Executable				"Executable" ;# NEW

::dialog::fsbox::mc::LinkTo					"Länka till %s"
::dialog::fsbox::mc::LinkTarget				"Länkmål"
::dialog::fsbox::mc::Directory				"Folder"

::dialog::fsbox::mc::Title(open)				"Select File" ;# NEW
::dialog::fsbox::mc::Title(save)				"Save File" ;# NEW
::dialog::fsbox::mc::Title(dir)				"Choose Directory" ;# NEW

::dialog::fsbox::mc::Content					"Innehåll"
::dialog::fsbox::mc::Open						"Öppna"

::dialog::fsbox::mc::FileType(exe)			"Executables" ;# NEW
::dialog::fsbox::mc::FileType(txt)			"Text files" ;# NEW
::dialog::fsbox::mc::FileType(log)			"Log files" ;# NEW
::dialog::fsbox::mc::FileType(bin)			"Binary files" ;# NEW

### choosecolor ########################################################
::dialog::choosecolor::mc::Ok					"&OK"
::dialog::choosecolor::mc::Cancel			"&Avbryt"

::dialog::choosecolor::mc::BaseColors		"Basfärger"
::dialog::choosecolor::mc::UserColors		"Använderpallett"
::dialog::choosecolor::mc::RecentColors	"Senaste färger"
::dialog::choosecolor::mc::Old				"Tidigare"
::dialog::choosecolor::mc::Current			"Aktuell"
::dialog::choosecolor::mc::HexCode			"Hex Code" ;# NEW
::dialog::choosecolor::mc::ColorSelection	"Färgval"
::dialog::choosecolor::mc::Red				"Rött"
::dialog::choosecolor::mc::Green				"Grönt"
::dialog::choosecolor::mc::Blue				"Blått"
::dialog::choosecolor::mc::Hue				"Färgton"
::dialog::choosecolor::mc::Saturation		"Färgmättnad"
::dialog::choosecolor::mc::Value				"Värde"
::dialog::choosecolor::mc::Enter				"Enter"
::dialog::choosecolor::mc::AddColor			"Lägg till aktuell färg till användarpallet"

### choosefont #########################################################
::dialog::choosefont::mc::Apply				"&Verkställ"
::dialog::choosefont::mc::Cancel				"&Avbryt"
::dialog::choosefont::mc::Continue			"Forts&ätt"
::dialog::choosefont::mc::FixedOnly			"&Enbart teckensnitt med fast bredd"
::dialog::choosefont::mc::Family				"Fam&ilj"
::dialog::choosefont::mc::Font				"&Font"
::dialog::choosefont::mc::Ok					"&OK"
::dialog::choosefont::mc::Reset				"&Återställ"
::dialog::choosefont::mc::Size				"&Storlek"
::dialog::choosefont::mc::Strikeout			"Överstru&ket"
::dialog::choosefont::mc::Style				"S&til"
::dialog::choosefont::mc::Underline			"&Understryket"
::dialog::choosefont::mc::Color				"Fä&rg"

::dialog::choosefont::mc::Regular			"Normalt"
::dialog::choosefont::mc::Bold				"Fet"
::dialog::choosefont::mc::Italic				"Kursivt"
{::dialog::choosefont::mc::Bold Italic}	"Fet kursivt"

::dialog::choosefont::mc::Effects			"Effekter"
::dialog::choosefont::mc::Filter				"Filter"
::dialog::choosefont::mc::Sample				"Exempel"
::dialog::choosefont::mc::SearchTitle		"Söker efter teckensnitt med fast bredd."
::dialog::choosefont::mc::SeveralMinutes	"Denna operation kan ta ungefär %d minuter."
::dialog::choosefont::mc::FontSelection	"Font Selection"
::dialog::choosefont::mc::Wait				"Vänta"

### choosedir ##########################################################
::choosedir::mc::ShowPredecessor	"Show Predecessor"
::choosedir::mc::ShowTail			"Show Tail"
::choosedir::mc::Folder				"Folder"

### fsbox ##############################################################
::fsbox::mc::Name								"Namn"
::fsbox::mc::Size								"Storlek"
::fsbox::mc::Modified						"Senast ändrad"

::fsbox::mc::Forward							"Framåt till '%s'"
::fsbox::mc::Backward						"Bakåt till '%s'"
::fsbox::mc::Delete							"Radera"
::fsbox::mc::MoveToTrash					"Move to Trash" ;# NEW
::fsbox::mc::Restore							"Återställ"
::fsbox::mc::Duplicate						"Duplicera"
::fsbox::mc::CopyOf							"Kopia av %s"
::fsbox::mc::NewFolder						"Ny folder"
::fsbox::mc::Layout							"Layout"
::fsbox::mc::ListLayout						"Spaltlayout"
::fsbox::mc::DetailedLayout				"Detaljerad layout"
::fsbox::mc::ShowHiddenDirs				"Visa dolda foldrar"
::fsbox::mc::ShowHiddenFiles				"Visa dolda filer och foldrar"
::fsbox::mc::AppendToExisitingFile		"&Lägg till partier till en existerande fil"
::fsbox::mc::Cancel							"&Avbryt"
::fsbox::mc::Save								"&Spara"
::fsbox::mc::Open								"&Öppna"
::fsbox::mc::Overwrite						"&Overwrite" ;# NEW
::fsbox::mc::Rename							"&Byt namn"
::fsbox::mc::Move								"Move" ;# NEW

::fsbox::mc::AddBookmark					"Lägg till bokmärke '%s'"
::fsbox::mc::RemoveBookmark				"Ta bort bokmärke '%s'"
::fsbox::mc::RenameBookmark				"Byt namn på bokmärke '%s'"

::fsbox::mc::Filename						"Fil&namn:"
::fsbox::mc::Filenames						"Fil&namn:"
::fsbox::mc::Directory						"&Folder:" ;# NEW
::fsbox::mc::FilesType						"Filer av &typ:"
::fsbox::mc::FileEncoding					"Fil&kodning:"

::fsbox::mc::Favorites						"Favoriter"
::fsbox::mc::LastVisited					"Senast besökt"
::fsbox::mc::FileSystem						"Filsystem"
::fsbox::mc::Desktop							"Skrivbord"
::fsbox::mc::Trash							"Papperskorg"
::fsbox::mc::Home								"Hem"

::fsbox::mc::SelectEncoding				"Välj kodning av databas (öppnar en dialog)"
::fsbox::mc::SelectWhichType				"Välj vilken filtyp som ska visas"
::fsbox::mc::TimeFormat						"%Y-%m-%d %H:%M"

::fsbox::mc::CannotChangeDir				"Kan inte byta till foldern \"%s\".\nÅtkomst nekad."
::fsbox::mc::DirectoryRemoved				"Kan inte byta till foldern \"%s\".\nFoldern är borttagen."
::fsbox::mc::DeleteFailed					"Det gick inte att radera '%s'."
::fsbox::mc::RestoreFailed					"Det gick inte att återställa '%s'."
::fsbox::mc::CommandFailed					"Command '%s' failed."
::fsbox::mc::CopyFailed						"Det gick inte att kopiera filen '%s': åtkomst nekad."
::fsbox::mc::CannotCopy						"Kan inte skapa en kopia, filen '%s' finns redan."
::fsbox::mc::CannotDuplicate				"Kan inte duplicera filen '%s'. Tillstånd att läsa saknas."
::fsbox::mc::ReallyDuplicateFile			"Är du säker att filen ska dupliceras?"
::fsbox::mc::ReallyDuplicateDetail		"Denna fil har omkring %s. Dupliceringen kan ta en stund."
::fsbox::mc::InvalidFileExt				"Operationen misslyckades: '%s' har ett ogiltigt filtilläggg."
::fsbox::mc::CannotRename					"Kan inte byta namn till '%s'. Det finns redan en folder/fil med det namnet."
::fsbox::mc::CannotCreate					"Kan inte skapa foldern '%s' Det finns redan en folder/fil med det namnet."
::fsbox::mc::ErrorCreate					"Fel vid skapande av folder: åtkomst nekad."
::fsbox::mc::FilenameNotAllowed			"Filnamnet '%s' är inte tillåtet."
::fsbox::mc::ContainsTwoDots				"Innehåller två punkter efter varandra."
::fsbox::mc::ContainsReservedChars		"Innehåller reserverade tecken: %s, eller ett kontrolltecken (ASCII 0-31)."
::fsbox::mc::InvalidFileName				"Ett filnamn kan inte börja med ett bindestreck och kan inte sluta med ett blanksteg eller en punkt." ;# NEW
::fsbox::mc::IsReservedName				"I somliga operativsystem är detta ett reserverad namn."
::fsbox::mc::FilenameTooLong				"Ett filnamn ska ha mindre än 256 tecken." ;# NEW
::fsbox::mc::InvalidFileExtension		"Ogiltigt filtillägg i '%s'."
::fsbox::mc::MissingFileExtension		"Inget filtillägg i '%s'."
::fsbox::mc::FileAlreadyExists			"Filen \"%s\" finns redan.\n\nVill du skriva över filen?"
::fsbox::mc::CannotOverwriteDirectory	"Kan inte skriva över folder '%s'."
::fsbox::mc::FileDoesNotExist				"Filen \"%s\" finns inte."
::fsbox::mc::DirectoryDoesNotExist		"Foldern \"%s\" finns inte."
::fsbox::mc::CannotOpenOrCreate			"Kan inte öppna/skapa '%s'. Var vänlig och välj en folder."
::fsbox::mc::WaitWhileDuplicating		"Var vänlig vänta, filen dupliceras..."
::fsbox::mc::FileHasDisappeared			"Filen '%s' är försvunnen."
::fsbox::mc::CurrentlyInUse				"Filen '%s' används."
::fsbox::mc::PermissionDenied				"Åtkomst nekad för foldern '%s'."
::fsbox::mc::CannotOpenUri					"Kan inte öppna följande  URI:"
::fsbox::mc::InvalidUri						"Innehåll som släpps är inte en giltig URI-lista."
::fsbox::mc::UriRejected					"Följande filer är förkastade:"
::fsbox::mc::UriRejectedDetail			"Only the listed file types can be handled." ;# NEW
::fsbox::mc::CannotOpenTrashFiles		"Cannot open files from trash:" ;# NEW
::fsbox::mc::CannotOpenRemoteFiles		"Cannot open remote files:" ;# NEW (http://*)
::fsbox::mc::OperationAborted				"Operation aborted." ;# NEW
::fsbox::mc::ApplyOnDirectories			"Are you sure that you want to apply the selected operation on (the following) directories?" ;# NEW
::fsbox::mc::EntryAlreadyExists			"Entry already exists" ;# NEW
::fsbox::mc::AnEntryAlreadyExists		"An entry '%s' already exists." ;# NEW
::fsbox::mc::SourceDirectoryIs			"The source directories is '%s'." ;# NEW
::fsbox::mc::NewName							"New name" ;# NEW

::fsbox::mc::ReallyMove(file,w)			"Är du säker att filen '%s' ska flyttas till papperskorgen?"
::fsbox::mc::ReallyMove(file,r)			"Är du säker att den skrivskyddade filen '%s' ska flyttas till papperskorgen?"
::fsbox::mc::ReallyMove(folder,w)		"Är du säker att foldern '%s' ska flyttas till papperskorgen?"
::fsbox::mc::ReallyMove(folder,r)		"Är du säker att den skrivskyddade foldern '%s' ska flyttas till papperskorgen?"
::fsbox::mc::ReallyDelete(file,w)		"Är du säker att filen '%s' ska raderas? Denna åtgärd kan inte ångras."
::fsbox::mc::ReallyDelete(file,r)		"Är du säker att den skrivskyddade filen '%s' ska raderas? Denna åtgärd kan inte ångras."
::fsbox::mc::ReallyDelete(link,w)		"Är du säker att länken till '%s' ska raderas?"
::fsbox::mc::ReallyDelete(link,r)		"Är du säker att länken till '%s' ska raderas?"
::fsbox::mc::ReallyDelete(folder,w)		"Är du säker att folder '%s'ska raderas? Denna åtgärd kan inte ångras."
::fsbox::mc::ReallyDelete(folder,r)		"Är du säker att den skrivskyddade foldern '%s' ska raderas? Denna åtgärd kan inte ångras."

::fsbox::mc::ErrorRenaming(folder)		"Fel vid namnbyte av foldern '%old' till '%new': åtkomst nekad."
::fsbox::mc::ErrorRenaming(file)			"Fel vid namnbyte av filen '%old' till '%new': åtkomst nekad."

::fsbox::mc::Cannot(delete)				"Kan inte radera filen '%s'."
::fsbox::mc::Cannot(rename)				"Kan inte byta namn på filen '%s'."
::fsbox::mc::Cannot(move)					"Cannot move file '%s'." ;# NEW
::fsbox::mc::Cannot(overwrite)			"Kan inte skriva över filen '%s'."

::fsbox::mc::DropAction(move)				"Move Here" ;# NEW
::fsbox::mc::DropAction(copy)				"Copy Here" ;# NEW
::fsbox::mc::DropAction(link)				"Link Here" ;# NEW

### toolbar ############################################################
::toolbar::mc::Toolbar		"Verktygsfält"
::toolbar::mc::Orientation	"Orientering"
::toolbar::mc::Alignment	"Anpassning"
::toolbar::mc::IconSize		"Ikonstorlek"

::toolbar::mc::Default		"Standard"
::toolbar::mc::Small			"Liten"
::toolbar::mc::Medium		"Medium"
::toolbar::mc::Large			"Stor"

::toolbar::mc::Top			"Överst"
::toolbar::mc::Bottom		"Nederst"
::toolbar::mc::Left			"Vänster"
::toolbar::mc::Right			"Höger"
::toolbar::mc::Center		"Centrerad"

::toolbar::mc::Flat			"Flat"
::toolbar::mc::Floating		"Svävande"
::toolbar::mc::Hide			"Dold"

::toolbar::mc::Expand		"Expandera"

### Countries ##########################################################
::country::mc::Afghanistan											"Afghanistan"
::country::mc::Netherlands_Antilles								"Nederländska antillerna"
::country::mc::Anguilla												"Anguilla"
::country::mc::Aboard_Aircraft									"Ombord flygplan"
::country::mc::Aaland_Islands										"Åland"
::country::mc::Albania												"Albanien"
::country::mc::Algeria												"Algeriet"
::country::mc::Andorra												"Andorra"
::country::mc::Angola												"Angola"
::country::mc::Antigua												"Antigua och Barbuda"
::country::mc::Australasia											"Australasia"
::country::mc::Argentina											"Argentina"
::country::mc::Armenia												"Armenien"
::country::mc::Aruba													"Aruba"
::country::mc::American_Samoa										"Amerikanska Samoa"
::country::mc::Antarctica											"Antarktis"
::country::mc::French_Southern_Territories					"Franska sydterritorierna"
::country::mc::Australia											"Australien"
::country::mc::Austria												"Österrike"
::country::mc::Azerbaijan											"Azerbajdzjan"
::country::mc::Bahamas												"Bahamas"
::country::mc::Bangladesh											"Bangladesh"
::country::mc::Barbados												"Barbados"
::country::mc::Basque												"Baskien"
::country::mc::Burundi												"Burundi"
::country::mc::Belgium												"Belgien"
::country::mc::Benin													"Benin"
::country::mc::Bermuda												"Bermudas"
::country::mc::Bhutan												"Bhutan"
::country::mc::Bosnia_and_Herzegovina							"Bosnien och Herzegovina"
::country::mc::Belize												"Belize"
::country::mc::Belarus												"Vitryssland"
::country::mc::Bolivia												"Bolivia"
::country::mc::Brazil												"Brasilien"
::country::mc::Bahrain												"Bahrain"
::country::mc::Brunei												"Brunei"
::country::mc::Botswana												"Botswana"
::country::mc::Bulgaria												"Bulgarien"
::country::mc::Burkina_Faso										"Burkina Faso"
::country::mc::Bouvet_Islands										"Bouvetön"
::country::mc::Central_African_Republic						"Centralafrikanska republiken"
::country::mc::Cambodia												"Kambodja"
::country::mc::Canada												"Kanada"
::country::mc::Catalonia											"Katalonien"
::country::mc::Cayman_Islands										"Caymanöarna"
::country::mc::Cocos_Islands										"Cocosöarna"
::country::mc::Congo													"Kongo (Brazzaville)"
::country::mc::Chad													"Tchad"
::country::mc::Chile													"Chile"
::country::mc::China													"Kina"
::country::mc::Ivory_Coast											"Elfenbenskusten"
::country::mc::Cameroon												"Kamerun"
::country::mc::DR_Congo												"DR Kongo"
::country::mc::Cook_Islands										"Cooköarna"
::country::mc::Colombia												"Colombia"
::country::mc::Comoros												"Comoros"
::country::mc::Cape_Verde											"Cape Verde"
::country::mc::Costa_Rica											"Costa Rica"
::country::mc::Croatia												"Kroatien"
::country::mc::Cuba													"Kuba"
::country::mc::Christmas_Island									"Christmas Island"
::country::mc::Cyprus												"Cypern"
::country::mc::Czech_Republic										"Tjeckien"
::country::mc::Denmark												"Danmark"
::country::mc::Djibouti												"Djibouti"
::country::mc::Dominica												"Dominica"
::country::mc::Dominican_Republic								"Dominikanska republiken"
::country::mc::Ecuador												"Ecuador"
::country::mc::Egypt													"Egypten"
::country::mc::England												"England"
::country::mc::Eritrea												"Eritrea"
::country::mc::El_Salvador											"El Salvador"
::country::mc::Western_Sahara										"Västsahara"
::country::mc::Spain													"Spanien"
::country::mc::Estonia												"Estland"
::country::mc::Ethiopia												"Ethiopien"
::country::mc::Faroe_Islands										"Färöarna"
::country::mc::Fiji													"Fiji"
::country::mc::Finland												"Finland"
::country::mc::Falkland_Islands									"Falklandsöarna"
::country::mc::France												"Frankrike"
::country::mc::West_Germany										"Västtyskland"
::country::mc::Micronesia											"Micronesia"
::country::mc::Gabon													"Gabon"
::country::mc::Gambia												"Gambia"
::country::mc::Great_Britain										"Storbritannien"
::country::mc::Guinea_Bissau										"Guinea-Bissau"
::country::mc::Gibraltar											"Gibraltar"
::country::mc::Guernsey												"Guernsey"
::country::mc::East_Germany										"Östtyskland"
::country::mc::Georgia												"Georgia"
::country::mc::Equatorial_Guinea									"Equatorial Guinea"
::country::mc::Germany												"Tyskland"
::country::mc::Ghana													"Ghana"
::country::mc::Guadeloupe											"Guadeloupe"
::country::mc::Greece												"Grekland"
::country::mc::Grenada												"Grenada"
::country::mc::Greenland											"Grönland"
::country::mc::Guatemala											"Guatemala"
::country::mc::French_Guiana										"Franska Guyana"
::country::mc::Guinea												"Guinea"
::country::mc::Guam													"Guam"
::country::mc::Guyana												"Guyana"
::country::mc::Haiti													"Haiti"
::country::mc::Hong_Kong											"Hong Kong"
::country::mc::Heard_Island_and_McDonald_Islands			"Heard Island and McDonald Islands"
::country::mc::Honduras												"Honduras"
::country::mc::Hungary												"Ungern"
::country::mc::Isle_of_Man											"Isle of Man"
::country::mc::Indonesia											"Indonesien"
::country::mc::India													"Indien"
::country::mc::British_Indian_Ocean_Territory				"British Indian Ocean Territory"
::country::mc::Iran													"Iran"
::country::mc::Ireland												"Irland"
::country::mc::Iraq													"Irak"
::country::mc::Iceland												"Island"
::country::mc::Israel												"Israel"
::country::mc::Italy													"Italien"
::country::mc::British_Virgin_Islands							"British Virgin Islands"
::country::mc::Jamaica												"Jamaica"
::country::mc::Jersey												"Jersey"
::country::mc::Jordan												"Jordanien"
::country::mc::Japan													"Japan"
::country::mc::Kazakhstan											"Kazakhstan"
::country::mc::Kenya													"Kenya"
::country::mc::Kosovo												"Kosovo"
::country::mc::Kyrgyzstan											"Kirgistan"
::country::mc::Kiribati												"Kiribati"
::country::mc::South_Korea											"Sydkorea"
::country::mc::Saudi_Arabia										"Saudiarabien"
::country::mc::Kuwait												"Kuwait"
::country::mc::Laos													"Laos"
::country::mc::Latvia												"Lettland"
::country::mc::Libya													"Libyen"
::country::mc::Liberia												"Liberia"
::country::mc::Saint_Lucia											"Saint Lucia"
::country::mc::Lesotho												"Lesotho"
::country::mc::Lebanon												"Libanon"
::country::mc::Liechtenstein										"Liechtenstein"
::country::mc::Lithuania											"Litauen"
::country::mc::Luxembourg											"Luxemburg"
::country::mc::Macao													"Macao"
::country::mc::Madagascar											"Madagaskar"
::country::mc::Morocco												"Marokko"
::country::mc::Malaysia												"Malaysia"
::country::mc::Malawi												"Malawi"
::country::mc::Moldova												"Moldavien"
::country::mc::Maldives												"Maldiverna"
::country::mc::Mexico												"Mexiko"
::country::mc::Mongolia												"Mongoliet"
::country::mc::Marshall_Islands									"Marshall Islands"
::country::mc::Macedonia											"Makedonien"
::country::mc::Mali													"Mali"
::country::mc::Malta													"Malta"
::country::mc::Montenegro											"Montenegro"
::country::mc::Northern_Mariana_Islands						"Northern Mariana Islands"
::country::mc::Monaco												"Monaco"
::country::mc::Mozambique											"Mozambique"
::country::mc::Mauritius											"Mauritius"
::country::mc::Montserrat											"Montserrat"
::country::mc::Mauritania											"Mauritanien"
::country::mc::Martinique											"Martinique"
::country::mc::Myanmar												"Myanmar"
::country::mc::Mayotte												"Mayotte"
::country::mc::Namibia												"Namibia"
::country::mc::Nicaragua											"Nicaragua"
::country::mc::New_Caledonia										"New Caledonia"
::country::mc::Netherlands											"Nederländerna"
::country::mc::Nepal													"Nepal"
::country::mc::The_Internet										"The Internet"
::country::mc::Norfolk_Island										"Norfolk Island"
::country::mc::Nigeria												"Nigeria"
::country::mc::Niger													"Niger"
::country::mc::Northern_Ireland									"Nordirland"
::country::mc::Niue													"Niue"
::country::mc::Norway												"Norge"
::country::mc::Nauru													"Nauru"
::country::mc::New_Zealand											"Nya Zealand"
::country::mc::Oman													"Oman"
::country::mc::Pakistan												"Pakistan"
::country::mc::Panama												"Panama"
::country::mc::Paraguay												"Paraguay"
::country::mc::Pitcairn_Islands									"Pitcairn Islands"
::country::mc::Peru													"Peru"
::country::mc::Philippines											"Philippines"
::country::mc::Palestine											"Palestinien"
::country::mc::Palau													"Palau"
::country::mc::Papua_New_Guinea									"Papua Nya Guinea"
::country::mc::Poland												"Polen"
::country::mc::Portugal												"Portugal"
::country::mc::North_Korea											"Nordkorea"
::country::mc::Puerto_Rico											"Puerto Rico"
::country::mc::French_Polynesia									"Franska Polynesien"
::country::mc::Qatar													"Qatar"
::country::mc::Reunion												"Reunion"
::country::mc::Romania												"Rumänien"
::country::mc::South_Africa										"Sydafrika"
::country::mc::Russia												"Ryssland"
::country::mc::Rwanda												"Rwanda"
::country::mc::Samoa													"Samoa"
::country::mc::Serbia_and_Montenegro							"Serbien och Montenegro"
::country::mc::Scotland												"Skottland"
::country::mc::At_Sea												"Till sjöss"
::country::mc::Senegal												"Senegal"
::country::mc::Seychelles											"Seychellerna"
::country::mc::South_Georgia_and_South_Sandwich_Islands	"South Georgia and South Sandwich Islands"
::country::mc::Saint_Helena										"Saint Helena"
::country::mc::Singapore											"Singapore"
::country::mc::Jan_Mayen_and_Svalbard							"Svalbard och Jan Mayen"
::country::mc::Saint_Kitts_and_Nevis							"Saint Kitts and Nevis"
::country::mc::Sierra_Leone										"Sierra Leone"
::country::mc::Slovenia												"Slovenien"
::country::mc::San_Marino											"San Marino"
::country::mc::Solomon_Islands									"Solomon Islands"
::country::mc::Somalia												"Somalia"
::country::mc::Aboard_Spacecraft									"Ombord rymdskepp"
::country::mc::Saint_Pierre_and_Miquelon						"Saint Pierre and Miquelon"
::country::mc::Serbia												"Serbien"
::country::mc::Sri_Lanka											"Sri Lanka"
::country::mc::Sao_Tome_and_Principe							"Sao Tome and Principe"
::country::mc::Sudan													"Sudan"
::country::mc::Switzerland											"Schweiz"
::country::mc::Suriname												"Suriname"
::country::mc::Slovakia												"Slovakien"
::country::mc::Sweden												"Sverige"
::country::mc::Swaziland											"Swaziland"
::country::mc::Syria													"Syrien"
::country::mc::Tanzania												"Tanzania"
::country::mc::Turks_and_Caicos_Islands						"Turks and Caicos Islands"
::country::mc::Czechoslovakia										"Tjeckoslovakien"
::country::mc::Tonga													"Tonga"
::country::mc::Thailand												"Thailand"
::country::mc::Tibet													"Tibet"
::country::mc::Tajikistan											"Tajikistan"
::country::mc::Tokelau												"Tokelau"
::country::mc::Turkmenistan										"Turkmenistan"
::country::mc::Timor_Leste											"Timor Leste"
::country::mc::Togo													"Togo"
::country::mc::Chinese_Taipei										"Taiwan"
::country::mc::Trinidad_and_Tobago								"Trinidad and Tobago"
::country::mc::Tunisia												"Tunisien"
::country::mc::Turkey												"Turkiet"
::country::mc::Tuvalu												"Tuvalu"
::country::mc::United_Arab_Emirates								"Förenade Arabaemiraten"
::country::mc::Uganda												"Uganda"
::country::mc::Ukraine												"Ukraina"
::country::mc::United_States_Minor_Outlying_Islands		"United States Minor Outlying Islands"
::country::mc::Unknown												"(Okänd)"
::country::mc::Soviet_Union										"Sovjetunionen"
::country::mc::Uruguay												"Uruguay"
::country::mc::United_States_of_America						"USA"
::country::mc::Uzbekistan											"Uzbekistan"
::country::mc::Vanuatu												"Vanuatu"
::country::mc::Vatican												"Vatikan"
::country::mc::Venezuela											"Venezuela"
::country::mc::Vietnam												"Vietnam"
::country::mc::Saint_Vincent_and_the_Grenadines				"Saint Vincent and the Grenadines"
::country::mc::US_Virgin_Islands									"US Virgin Islands"
::country::mc::Wallis_and_Futuna									"Wallis and Futuna"
::country::mc::Wales													"Wales"
::country::mc::Yemen													"Yemen"
::country::mc::Yugoslavia											"Jugoslavien"
::country::mc::Zambia												"Zambia"
::country::mc::Zanzibar												"Zanzibar"
::country::mc::Zimbabwe												"Zimbabwe"
::country::mc::Mixed_Team											"Mixed Team"

::country::mc::Africa_North										"Nordafrika"
::country::mc::Africa_Sub_Saharan								"Afrika, Sub-Sahara"
::country::mc::America_Caribbean									"Amerika, Caribbean"
::country::mc::America_Central									"Centralamerika"
::country::mc::America_North										"Nordamerika"
::country::mc::America_South										"Sydamerika"
::country::mc::Antarctic											"Antarktik"
::country::mc::Asia_East											"Östasien"
::country::mc::Asia_South_South_East							"Sydöstasien"
::country::mc::Asia_West_Central									"Väst-/Centralasien"
::country::mc::Europe												"Europa"
::country::mc::Europe_East											"Östeuropa"
::country::mc::Oceania												"Oceanien"
::country::mc::Stateless											"Statslös"

### Languages ##########################################################
::encoding::mc::Lang(FI)	"Fide"
::encoding::mc::Lang(af)	"Afrikaans"
::encoding::mc::Lang(ar)	"Arabiska"
::encoding::mc::Lang(ast)	"Leonesiska"
::encoding::mc::Lang(az)	"Azerbajdzjanska"
::encoding::mc::Lang(bat)	"Baltic"
::encoding::mc::Lang(be)	"Belarusian"
::encoding::mc::Lang(bg)	"Bulgarian"
::encoding::mc::Lang(br)	"Breton"
::encoding::mc::Lang(bs)	"Bosnian"
::encoding::mc::Lang(ca)	"Catalan"
::encoding::mc::Lang(cs)	"Tjeckiska"
::encoding::mc::Lang(cy)	"Welsh"
::encoding::mc::Lang(da)	"Danska"
::encoding::mc::Lang(de)	"Tyska"
::encoding::mc::Lang(de+)	"Deutsch (reformed)" ;# NEW
::encoding::mc::Lang(el)	"Grekiska"
::encoding::mc::Lang(en)	"Engelska"
::encoding::mc::Lang(eo)	"Esperanto"
::encoding::mc::Lang(es)	"Spanska"
::encoding::mc::Lang(et)	"Estniska"
::encoding::mc::Lang(eu)	"Basque"
::encoding::mc::Lang(fi)	"Finska"
::encoding::mc::Lang(fo)	"Faroese"
::encoding::mc::Lang(fr)	"Franska"
::encoding::mc::Lang(fy)	"Frisian"
::encoding::mc::Lang(ga)	"Irish"
::encoding::mc::Lang(gd)	"Scottish"
::encoding::mc::Lang(gl)	"Galician"
::encoding::mc::Lang(he)	"Hebrew"
::encoding::mc::Lang(hi)	"Hindi"
::encoding::mc::Lang(hr)	"Croatian"
::encoding::mc::Lang(hu)	"Ungerska"
::encoding::mc::Lang(hy)	"Armenian"
::encoding::mc::Lang(ia)	"Interlingua"
::encoding::mc::Lang(is)	"Isländska"
::encoding::mc::Lang(it)	"Italian"
::encoding::mc::Lang(iu)	"Inuktitut"
::encoding::mc::Lang(ja)	"Japanese"
::encoding::mc::Lang(ka)	"Georgian"
::encoding::mc::Lang(kk)	"Kazakh"
::encoding::mc::Lang(kl)	"Greenlandic"
::encoding::mc::Lang(ko)	"Korean"
::encoding::mc::Lang(ku)	"Kurdish"
::encoding::mc::Lang(ky)	"Kirghiz"
::encoding::mc::Lang(la)	"Latin"
::encoding::mc::Lang(lb)	"Luxembourgish"
::encoding::mc::Lang(lt)	"Lithuanian"
::encoding::mc::Lang(lv)	"Latvian"
::encoding::mc::Lang(mk)	"Macedonian"
::encoding::mc::Lang(mo)	"Moldovan"
::encoding::mc::Lang(ms)	"Malay"
::encoding::mc::Lang(mt)	"Maltese"
::encoding::mc::Lang(nl)	"Dutch"
::encoding::mc::Lang(no)	"Norska"
::encoding::mc::Lang(oc)	"Occitan"
::encoding::mc::Lang(pl)	"Polska"
::encoding::mc::Lang(pt)	"Portuguese"
::encoding::mc::Lang(rm)	"Romansh"
::encoding::mc::Lang(ro)	"Romanian"
::encoding::mc::Lang(ru)	"Ryska"
::encoding::mc::Lang(se)	"Sami"
::encoding::mc::Lang(sk)	"Slovak"
::encoding::mc::Lang(sl)	"Slovenian"
::encoding::mc::Lang(sq)	"Albanian"
::encoding::mc::Lang(sr)	"Serbiska"
::encoding::mc::Lang(sv)	"Svenska"
::encoding::mc::Lang(sw)	"Swahili"
::encoding::mc::Lang(tg)	"Tajik"
::encoding::mc::Lang(th)	"Thai"
::encoding::mc::Lang(tk)	"Turkmen"
::encoding::mc::Lang(tl)	"Tagalog"
::encoding::mc::Lang(tr)	"Turkish"
::encoding::mc::Lang(uk)	"Ukrainian"
::encoding::mc::Lang(uz)	"Uzbek"
::encoding::mc::Lang(vi)	"Vietnamese"
::encoding::mc::Lang(wa)	"Walloon"
::encoding::mc::Lang(wen)	"Sorbian"
::encoding::mc::Lang(hsb)	"Upper Sorbian"
::encoding::mc::Lang(dsb)	"Lower Sorbian"
::encoding::mc::Lang(zh)	"Chinese"

::encoding::mc::Font(hi)	"Devanagari"

### Calendar ###########################################################
::calendar::mc::OneMonthForward	"En månad framåt(Shift \u2192)"
::calendar::mc::OneMonthBackward	"En månad bakåt(Shift \u2190)"
::calendar::mc::OneYearForward	"Ett år framåt (Ctrl \u2192)"
::calendar::mc::OneYearBackward	"Ett år bakåt(Ctrl \u2190)"

::calendar::mc::Su	"Sö"
::calendar::mc::Mo	"Må"
::calendar::mc::Tu	"Ti"
::calendar::mc::We	"On"
::calendar::mc::Th	"To"
::calendar::mc::Fr	"Fr"
::calendar::mc::Sa	"Lö"

::calendar::mc::Jan	"Jan"
::calendar::mc::Feb	"Feb"
::calendar::mc::Mar	"Mar"
::calendar::mc::Apr	"Apr"
::calendar::mc::May	"Maj"
::calendar::mc::Jun	"Jun"
::calendar::mc::Jul	"Jul"
::calendar::mc::Aug	"Aug"
::calendar::mc::Sep	"Sep"
::calendar::mc::Oct	"Okt"
::calendar::mc::Nov	"Nov"
::calendar::mc::Dec	"Dec"

::calendar::mc::MonthName(1)		"Januari"
::calendar::mc::MonthName(2)		"Februari"
::calendar::mc::MonthName(3)		"Mars"
::calendar::mc::MonthName(4)		"April"
::calendar::mc::MonthName(5)		"Maj"
::calendar::mc::MonthName(6)		"Juni"
::calendar::mc::MonthName(7)		"Juli"
::calendar::mc::MonthName(8)		"Augusti"
::calendar::mc::MonthName(9)		"September"
::calendar::mc::MonthName(10)		"Oktober"
::calendar::mc::MonthName(11)		"November"
::calendar::mc::MonthName(12)		"December"

::calendar::mc::WeekdayName(0)	"Söndag"
::calendar::mc::WeekdayName(1)	"Måndag"
::calendar::mc::WeekdayName(2)	"Tisdag"
::calendar::mc::WeekdayName(3)	"Onsdag"
::calendar::mc::WeekdayName(4)	"Torsdag"
::calendar::mc::WeekdayName(5)	"Fredag"
::calendar::mc::WeekdayName(6)	"Lördag"

### remote #############################################################
::remote::mc::PostponedMessage "Databasen \"%s\" kommer inte att öppnas förrän den pågående operationen är avslutad."

# vi:set ts=3 sw=3:
