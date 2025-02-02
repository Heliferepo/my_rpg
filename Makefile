##
## EPITECH PROJECT, 2021
## my_rpg
## File description:
## Makefile
##

CC = gcc

CFLAGS = -W -Wall -Werror -I./include -L./lib
CFLAGS += -D_POSIX_C_SOURCE=200809L -D_GNU_SOURCE -std=c99

ifeq ($(EPIDEBUG), 1)
	CFLAGS += -Wno-error=init-self -Winit-self
	CFLAGS += -Wno-error=shadow -Wshadow
	CFLAGS += -Wno-error=pointer-arith -Wpointer-arith
	CFLAGS += -Wno-error=duplicated-cond -Wduplicated-cond
	CFLAGS += -Wno-error=switch-enum -Wswitch-enum
	CFLAGS += -Wno-error=declaration-after-statement -Wdeclaration-after-statement
	CFLAGS += -Wno-error=float-equal -Wfloat-equal
	CFLAGS += -Wno-error=tautological-compare -Wtautological-compare
	CFLAGS += -Wno-error=array-bounds -Warray-bounds
	CFLAGS += -Wno-error=alloc-zero -Walloc-zero
	CFLAGS += -Wno-error=cast-qual -Wcast-qual
	CFLAGS += -Wno-error=extra -Wextra -Wnonnull
	CFLAGS += -fno-builtin
	CFLAGS += -ftrapv -ggdb -g3
	CFLAGS += -DDEBUG
endif

ifeq ($(SAN), 1)
	CFLAGS += -fsanitize=undefined,bounds-strict,address -fsanitize-recover=address -O1
	ASAN_OPTIONS=strict_string_checks=1:detect_stack_use_after_return=1:check_initialization_order=1:strict_init_order=1
endif

ifeq ($(APPIMAGE), 1)
	CFLAGS += -DAPPIMAGE
endif

LFLAGS = -ldistract -ltgoat -lcsfml-system -lcsfml-graphics -lcsfml-audio -lcsfml-window -lm

TEST_FLAGS = $(LFLAGS) -lcriterion --coverage

TARGET = my_rpg

TARGET_TEST = unit_tests

SRC_MAP =	src/entities/map_loader/map_loader.c \
		src/entities/map_loader/collision/collision_loader.c \
		src/entities/map_loader/collision/create_collision.c \
		src/entities/map_loader/object/create_layer_object_manager.c \
		src/entities/map_loader/object/destroy_object.c \
		src/entities/map_loader/object/get_object_info.c \
		src/entities/map_loader/object/message/destroy_message.c \
		src/entities/map_loader/object/message/load_pnj.c \
		src/entities/map_loader/object/message/load_pnj_type.c \
		src/entities/map_loader/object/warpzone/destroy_warpzone.c \
		src/entities/map_loader/object/warpzone/load_warp.c \
		src/entities/map_loader/object/warpzone/warp_entity.c \
		src/entities/map_loader/tileset/create_manager_tileset.c \
		src/entities/map_loader/tileset/create_tileset.c \
		src/entities/map_loader/tileset/load_tilesets.c \
		src/entities/map_loader/tileset/load_tileset_texture.c \
		src/entities/map_loader/tileset/load_vertex.c \
		src/entities/map_loader/tileset/set_txrot_quad.c \
		src/entities/map_loader/tileset/tileid_and_rotation.c \

SRC_HERO = src/entities/hero/hero.c \
    		src/entities/hero/hero_collision.c \
			src/entities/hero/player_move.c \
			src/entities/hero/hero_battle_rand.c

SRC_BUTTON = src/entities/gui_button/button.c \
			src/entities/gui_button/button_on_click.c

SRC_LABEL = src/entities/gui_label/label.c

SRC_LIFECYCLE = src/scenes/play/lifecycle.c \
        src/scenes/menu/lifecycle.c     \
        src/scenes/key_config/lifecycle.c \
        src/scenes/settings_menu/lifecycle.c  \
        src/scenes/settings_menu/create.c  \
		src/scenes/battle/lifecycle.c \

SRC_UTIL = src/util/sfml_deser.c \
		   src/util/get_save_state.c \
		   src/util/not_implemented.c \
		   src/util/property_loader.c	\
		   src/util/load_item.c


SRC_MENU = src/entities/menu/menu.c \
	   src/entities/menu/create_menu.c \

SRC_DEBUGMENU = src/entities/debugmenu/debugmenu.c \
		src/entities/debugmenu/keybind.c \
		src/entities/debugmenu/display.c \

SRC_INVENTORY	=	src/entities/inventory/create_inventory.c \
			src/entities/inventory/inventory.c \
			src/entities/inventory/inventory_ges.c	\
			src/entities/inventory/create_equipment_slot.c


SRC_BATTLE = src/entities/battlehud/battlehud.c \
			src/entities/battlehud/buttons.c \
			src/entities/battlehud/labels.c \
			src/entities/battlehud/attacks.c \
			src/entities/battlehud/attack_event.c \
			src/entities/battlemanager/animate.c \
			src/entities/battlemanager/battlemanager.c \
			src/entities/battlemanager/enemies.c \
			src/entities/battlemanager/friends.c \
			src/entities/battlemanager/attack.c \
			src/entities/battlemanager/attack_fx.c \
			src/entities/battlemanager/bard_talking.c \
			src/entities/battlemanager/battle.c \
			src/entities/battlemanager/start_battle.c \
			src/entities/battlemanager/boss.c

SRC_CINEMA = 	src/entities/cinema/cinema.c \
				src/entities/cinema/list.c \
				src/entities/cinema/parse_camera.c \
				src/entities/cinema/parse.c \
				src/entities/cinema/command.c \
				src/entities/cinema/command2.c \
				src/entities/cinema/load.c \
				src/entities/cinema/end.c \
				src/entities/cinema/parse_camera_disp.c

SRC_ATH	=	src/entities/ath/button_handler.c \
			src/entities/ath/func_btn.c \
			src/entities/ath/init.c

SRC_PAUSE	=	src/entities/pause_menu/pause_menu.c \
				src/entities/pause_menu/create_button.c	\
				src/entities/pause_menu/func.c

SRC_QUEST	=	src/entities/quest_menu/quest_menu.c	\
				src/entities/quest_menu/create_text.c

SRC = 	src/game.c \
		src/save.c \
	src/entities/settings/init_settings.c \
	src/entities/settings/init_scroll.c \
	src/entities/settings/mute_button.c	\
	src/entities/settings/init_select_button.c	\
	    src/entities/scroll_bar/scroll_bar.c    \
        src/entities/settings/setting_button.c	\
	    src/entities/settings/function_button.c	\
	    src/entities/settings/vfx_scroll.c	\
	    src/entities/settings/fonc_scroll_vfx.c	\
        src/entities/settings/set_size.c 	\
        src/entities/ath/ath.c \
        src/entities/view/view.c \
		src/entities/dialogbox/dialogbox.c \
		src/entities/dialogbox/create.c \
		src/entities/dialogbox/show_text.c \
		src/entities/dialogbox/dialogbox_events.c \
		src/entities/dialog/dialog.c \
		src/entities/dialog/is_dialog_visible.c \
		src/entities/npc/pnj_loader.c \
		src/entities/npc/create_pnj.c \
		src/entities/npc/pnj_drawing.c \
		src/entities/boss/boss.c \
		src/entities/boss/boss_update.c \
		src/entities/boss/create_boss.c \
        $(SRC_DEBUGMENU) \
        $(SRC_MENU) \
        $(SRC_UTIL) \
        $(SRC_MAP) \
        $(SRC_HERO) \
        $(SRC_LIFECYCLE) \
		$(SRC_BATTLE) \
		$(SRC_BUTTON) \
		$(SRC_LABEL) \
		$(SRC_INVENTORY) \
		$(SRC_CINEMA) \
		$(SRC_ATH)  \
    $(SRC_PAUSE)	\
	$(SRC_QUEST)

OBJ 	=	$(SRC:.c=.o)

TESTS =	\

all:
	${MAKE} -j build_all -C .

build_lib:
	${MAKE} -j -C ./lib/distract/
	${MAKE} -j -C ./lib/iron_goat/

re_lib:
	${MAKE} re -j -C ./lib/distract/
	${MAKE} re -j -C ./lib/iron_goat/

build_all:
	${MAKE} build_lib -j  -C .
	${MAKE} ${TARGET} -j  -C .

tests_run: clean_tests build_lib
	${CC} ${CFLAGS} ${TEST_FLAGS} -o ${TARGET_TEST} ${SRC} ${TESTS} ${LFLAGS}
	./${TARGET_TEST} --verbose

coverage:
	gcovr -b --exclude-directories tests
	gcovr -r . --exclude-directories tests

clean_tests:
	rm -rf ${TARGET_TEST}

$(TARGET): ${OBJ}
	${CC} ${CFLAGS} -o ${TARGET} ${OBJ} src/main.c ${LFLAGS}

appimage:
	APPIMAGE=1 make re
	docker run -v ${PWD}:/data:Z -w /data --rm appimagecrafters/appimage-builder:latest appimage-builder
	rm -f my_rpg ${OBJ}

clean:
	rm -f ${TARGET}
	${MAKE} clean -j -C ./lib/distract/
	${MAKE} clean -j -C ./lib/iron_goat/

fclean: clean
	rm -f ${LIB} *.gc* unit_tests ${OBJ}
	${MAKE} fclean -C ./lib/iron_goat/
	${MAKE} fclean -C ./lib/distract/

re: fclean all

.PHONY: all build_lib re_lib build_all tests_run clean_tests clean fclean re appimage
