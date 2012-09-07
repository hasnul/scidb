// ======================================================================
// Author : $Author$
// Version: $Revision$
// Date   : $Date$
// Url    : $URL$
// ======================================================================

// ======================================================================
//    _/|            __
//   // o\         /    )           ,        /    /
//   || ._)    ----\---------__----------__-/----/__-
//   //__\          \      /   '  /    /   /    /   )
//   )___(     _(____/____(___ __/____(___/____(___/_
// ======================================================================

// ======================================================================
// Copyright: (C) 2009-2012 Gregor Cramer
// ======================================================================

// ======================================================================
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
// ======================================================================

#ifndef _app_winboard_engine_included
#define _app_winboard_engine_included

#include "app_engine.h"

#include "db_board.h"
#include "db_move.h"

#include "m_vector.h"
#include "m_string.h"
#include "m_auto_ptr.h"

namespace mstl { class string; }
namespace db   { class Move; }
namespace db   { class Board; }

namespace app {
namespace winboard {

class Engine : public app::Engine::Concrete
{
public:

	Engine();
	~Engine() throw();	// gcc complains w/o explicit destructor

	bool startAnalysis(db::Board const& board) override;
	bool startAnalysis(db::Game const& game, bool isNew) override;
	bool stopAnalysis() override;
	bool isReady() const override;

	void timeout();

protected:

	void setupBoard(db::Board const& board);
	void reset();

	void protocolStart(bool isProbing) override;
	void protocolEnd() override;
	void sendNumberOfVariations() override;
	void processMessage(mstl::string const& message) override;
	void doMove(db::Game const& game, db::Move const& lastMove) override;

	Result probeResult() const override;
	unsigned probeTimeout() const override;

private:

	class Timer;

	typedef mstl::auto_ptr<Timer>		TimerP;
	typedef mstl::vector<db::Move>	History;

	void featureDone(bool done);
	void parseAnalysis(mstl::string const& msg);
	void parseInfo(mstl::string const& msg);
	void parseOption(mstl::string const& option);
	void parseFeatures(char const* msg);
	void detectFeatures(char const* identifier);
	void startAnalysis(	db::Board const& startBoard,
								db::Board const& currentBoard,
								History const& moves,
								bool isNew);
	void doMove(db::Move const& move);

	db::Board		m_board;
	TimerP			m_timer;
	mstl::string	m_variant;
	bool				m_response;
	bool				m_detected;
	bool				m_mustUseChess960;
	bool				m_mustUseNoCastle;
	bool				m_editSent;
	bool				m_dontInvertScore;
	bool				m_wholeSeconds;
	bool				m_featureUsermove;
	bool				m_featureColors;
	bool				m_featureSetboard;
	bool				m_featureSigint;
	bool				m_featureAnalyze;
	bool				m_featurePause;
	bool				m_featurePlayOther;
	bool				m_featureSan;
	bool				m_variantChess960;
	bool				m_variantNoCastle;
};

} // namespace winboard
} // namespace app

#endif // _app_winboard_engine_included

// vi:set ts=3 sw=3:
