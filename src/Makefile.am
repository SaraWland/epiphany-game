#SUBDIRS = entities

# Add include directory and all subdirectories to compiler flags
AM_CPPFLAGS = -I$(top_srcdir)/include \
	-I$(top_srcdir)/include/core \
	-I$(top_srcdir)/include/game_logic \
	-I$(top_srcdir)/include/entities \
	-I$(top_srcdir)/include/menu \
	-I$(top_srcdir)/include/rendering \
	-I$(top_srcdir)/include/config \
	-I$(top_srcdir)/include/parsers \
	-I$(top_srcdir)/include/fonts \
	-I$(top_srcdir)/include/tinyxml

bin_PROGRAMS = epiphany-game

epiphany_game_SOURCES = \
	main.cpp \
	core/sfx.cpp core/game.cpp core/game_timer.cpp core/input.cpp \
	core/music_manager.cpp core/sample.cpp core/epimap.cpp \
	game_logic/level.cpp game_logic/levelmap.cpp game_logic/entity.cpp \
	game_logic/entity_factory.cpp game_logic/entity_manager.cpp \
	rendering/screen.cpp rendering/sprite.cpp rendering/surface.cpp \
	rendering/surface_manager.cpp \
	menu/menu.cpp menu/menu_entry_bool.cpp menu/menu_entry_ranged.cpp \
	menu/menu_list_epiphany.cpp menu/menu_list_options.cpp \
	config/epiconfig.cpp config/xml_configuration.cpp \
	config/commandline_configuration.cpp \
	parsers/emdlparser.cpp parsers/myparser.cpp parsers/resource_factory.cpp \
	entities/entity_gem.cpp entities/entity_door.cpp entities/entity_wood.cpp \
	entities/entity_brick.cpp entities/entity_player.cpp entities/entity_falling.cpp \
	entities/entity_emerald.cpp entities/entity_peperon.cpp entities/entity_sapphire.cpp \
	entities/entity_flintstone.cpp entities/entity_explosion.cpp entities/entity_monster.cpp \
	entities/entity_boulder.cpp entities/entity_tomato.cpp entities/entity_steel.cpp \
	entities/entity_grass.cpp entities/entity_exit.cpp entities/entity_key.cpp \
	fonts/SFont.c fonts/font.cpp fonts/font_factory.cpp fonts/font_manager.cpp \
	tinyxml/tinystr.cpp tinyxml/tinyxmlerror.cpp tinyxml/tinyxmlparser.cpp tinyxml/tinyxml.cpp

epiphany_game_LDADD = -lSDL2 -lSDL2_mixer