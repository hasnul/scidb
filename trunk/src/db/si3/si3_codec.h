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
// Copyright: (C) 2009-2011 Gregor Cramer
// ======================================================================

// ======================================================================
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
// ======================================================================

#ifndef _si3_codec_included
#define _si3_codec_included

#include "db_database_codec.h"
#include "db_namebase.h"
#include "db_common.h"

#include "m_fstream.h"
#include "m_vector.h"
#include "m_string.h"
#include "m_bitset.h"

namespace util
{
	class ByteStream;
	class BlockFile;
}

namespace sys
{
	namespace utf8 { class Codec; };
};

namespace db {

class Consumer;
class Producer;
class GameData;
class GameInfo;
class NamebaseEntry;

namespace si3 {

class StoredLine;
class Consumer;
class NameList;

class Codec : public DatabaseCodec
{
public:

	Codec(CustomFlags* customFlags = 0);
	~Codec() throw();

	bool encodingFailed() const;
	bool isFormat3() const;
	bool isFormat4() const;

	Format format() const;

	unsigned maxGameRecordLength() const;
	unsigned maxGameLength() const;
	unsigned maxGameCount() const;
	unsigned maxPlayerCount() const;
	unsigned maxEventCount() const;
	unsigned maxSiteCount() const;
	unsigned maxAnnotatorCount() const;
	unsigned minYear() const;
	unsigned maxYear() const;
	unsigned maxDescriptionLength() const;

	unsigned gameFlags() const;
	unsigned blockSize() const;

	void filterTag(TagSet& tags, tag::ID tag) const;
	mstl::string const& extension() const;
	mstl::string const& encoding() const;
	uint32_t computeChecksum(unsigned flags, GameInfo const& info, unsigned crc) const;
	util::BlockFile* newBlockFile() const;

	void doOpen(mstl::string const& encoding);
	void doOpen(mstl::string const& rootname, mstl::string const& encoding);
	void doOpen(mstl::string const& rootname,
					mstl::string const& encoding,
					util::Progress& progress);
	void doClear(mstl::string const& rootname);

	unsigned putGame(util::ByteStream const& strm);
	util::ByteStream getGame(GameInfo const& info);
	void save(mstl::string const& rootname, unsigned start, util::Progress& progress);
	void attach(mstl::string const& rootname, util::Progress& progress);
	void update(mstl::string const& rootname);
	void update(mstl::string const& rootname, unsigned index, bool updateNamebase);
	void updateHeader(mstl::string const& rootname);
	void close();

	save::State doDecoding(db::Consumer& consumer, unsigned flags, TagSet& tags, GameInfo const& info);
	save::State doDecoding(	db::Consumer& consumer,
									util::ByteStream& strm,
									unsigned flags,
									TagSet& tags);
	void doDecoding(unsigned flags, GameData& data, GameInfo& info);

	void doEncoding(util::ByteStream& strm, GameData const& data, Signature const& signature);
	db::Consumer* getConsumer(format::Type srcFormat);

	void reset();
	void setEncoding(mstl::string const& encoding);
	bool saveRoundEntry(unsigned index, mstl::string const& value);
	void restoreRoundEntry(unsigned index);
	sys::utf8::Codec& codec();

	void useAsyncReader(bool flag);
	Move findExactPositionAsync(GameInfo const& info, Board const& position, bool skipVariations);

private:

	friend class Consumer;
	class ByteIStream;
	class ByteOStream;

	typedef mstl::vector<NamebaseEntry*> Lookup;

	void writeIndex(mstl::fstream& fstrm, unsigned start, util::Progress& progress);
	void writeIndexHeader(mstl::fstream& fstrm);
	void updateIndex(mstl::fstream& fstrm);
	void encodeIndex(GameInfo const& item, unsigned index, util::ByteStream& buf);

	void decodeIndex(util::ByteStream& strm, unsigned index);
	void decodeIndex(mstl::fstream &fstrm, util::Progress& progress);

	void readIndex(mstl::fstream& fstrm, util::Progress& progress);

	void readNamebase(mstl::fstream& stream, util::Progress& progress);
	void readNamebase(ByteIStream& stream,
							Namebase& base,
							unsigned maxFreq,
							unsigned count,
							unsigned limit);
	void writeNamebase(mstl::fstream& stream);
	void writeNamebase(mstl::fstream& stream, NameList& base);

	void save(mstl::string const& rootname, unsigned start, util::Progress& progress, bool attach);

	unsigned						m_headerSize;
	unsigned						m_indexEntrySize;
	unsigned						m_fileVersion;
	unsigned						m_autoLoad;
	mstl::string				m_extIndex;
	mstl::string				m_extGame;
	mstl::string				m_extNamebase;
	unsigned						m_blockSize;
	mstl::fstream				m_gameStream;
	mstl::fstream				m_gameStream2;
	Lookup						m_lookup[5];
	mstl::bitset				m_usedIdSet[5];
	Lookup						m_roundLookup;
	sys::utf8::Codec*			m_codec;
	CustomFlags*				m_customFlags;
	util::BlockFile*			m_gameData;
	util::BlockFileReader*	m_asyncReader;
	mstl::string				m_magicGameFile;
	bool							m_hasMagic;
	NameList*					m_playerList;
	NameList*					m_eventList;
	NameList*					m_siteList;
	NameList*					m_roundList;
	NamebaseEntry*				m_roundEntry;
};

} // namespace si3
} // namespace db

#include "si3_codec.ipp"

#endif // _si3_codec_included

// vi:set ts=3 sw=3:
