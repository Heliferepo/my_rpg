/*
** EPITECH PROJECT, 2021
** game
** File description:
** Source code
*/

#ifndef C2B24367_058C_4C72_ADEA_FD6702E90B19
    #define C2B24367_058C_4C72_ADEA_FD6702E90B19

    #include "distract/entity.h"
    #include "distract/game.h"

    int load_game(void);
    bool configure_state(game_t *game);
    void save_current(game_t *game);
    void default_save(game_t *game, int fd);
    void not_implemented(game_t *game, entity_t *entity);

#endif /* C2B24367_058C_4C72_ADEA_FD6702E90B19 */
