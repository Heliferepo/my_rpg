/*
** EPITECH PROJECT, 2021
** battlemanager
** File description:
** Source code
*/

#include "distract/util.h"
#include "myrpg/battle.h"
#include "stdlib.h"
#include "distract/game.h"
#include "distract/entity.h"
#include "distract/resources.h"
#include "distract/graphics.h"
#include "distract/debug.h"
#include "SFML/Window.h"
#include "SFML/Graphics.h"
#include "myrpg/entities.h"
#include "myrpg/asset.h"
#include "myrpg/define.h"
#include <SFML/Graphics/RenderWindow.h>

bool create_battlemanager(game_t *game UNUSED, entity_t *entity)
{
    battlemanager_t *battlemanager = dcalloc(sizeof(battlemanager_t), 1);

    D_ASSERT(battlemanager, NULL, "Could not create battle manager", false)
    battlemanager->entity = entity;
    battlemanager->clock = create_pausable_clock(game);
    D_ASSERT(battlemanager->clock, NULL,
        "Could not create battle manager clock", false)
    if (create_battlemanager_enemies(game, battlemanager) < 0)
        return (false);
    if (create_battlemanager_friends(game, battlemanager) < 0)
        return (false);
    if (create_battle_bard_talking(game, battlemanager) < 0)
        return (false);
    if (create_battle(game, battlemanager) < 0)
        return (false);
    entity->instance = battlemanager;
    return (true);
}

void destroy_battlemanager(game_t *game UNUSED, entity_t *entity)
{
    battlemanager_t *battlemanager = entity->instance;

    for (int i = 0; i < battlemanager->enemies_count; i++)
        sfSprite_destroy(battlemanager->enemies[i].animable.info.sprite);
    for (int i = 0; i < battlemanager->friends_count; i++)
        sfSprite_destroy(battlemanager->friends[i].animable.info.sprite);
    destroy_pausable_clock(battlemanager->clock);
    sfText_destroy(battlemanager->bard_talking);
    destroy_pausable_clock(battlemanager->bard_talking_clock);
    destroy_battle(game, battlemanager);
    free(battlemanager);
}

void update_battlemanager(game_t *game UNUSED, entity_t *entity)
{
    battlemanager_t *battlemanager = entity->instance;

    if (battlemanager->clock->time > 0.2f) {
        animate_battlemanager_sprites(battlemanager);
        battlemanager->clock->time = 0;
    }
    if (battlemanager->bard_talking_clock->time > 3.0f) {
        set_battle_bard_text(battlemanager, get_battle_random_bard_dialog());
        battlemanager->bard_talking_clock->time = 0;
    }
    update_battle(game, battlemanager);
    tick_pausable_clock(battlemanager->clock);
    tick_pausable_clock(battlemanager->bard_talking_clock);
}

void draw_battlemanager(game_t *game UNUSED, entity_t *entity)
{
    battlemanager_t *battlemanager = entity->instance;

    if (get_animable_animation(&battlemanager->friends[0].animable)
        == BAT_ANIM_IDLE)
        sfRenderWindow_drawText(game->window,
            battlemanager->bard_talking, NULL);
    for (int i = 0; i < battlemanager->enemies_count; i++)
        sfRenderWindow_drawSprite(game->window,
            battlemanager->enemies[i].animable.info.sprite, NULL);
    for (int i = 0; i < battlemanager->friends_count; i++)
        sfRenderWindow_drawSprite(game->window,
            battlemanager->friends[i].animable.info.sprite, NULL);
}

bool handle_battlemanager_events(game_t *game UNUSED,
    entity_t *entity UNUSED, sfEvent *event UNUSED)
{
    return (false);
}