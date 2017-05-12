#include "structs.h"

/*offsets*/
extern void *VRAM;
extern void *PRAM;
extern void *OAM;
extern void *volatile*DMA3SAD;
extern void *volatile*DMA3DAD;
extern vu32 *DMA3CNT;
extern struct task *tasks;
extern struct trainerdata **saveblock2;
extern u8 **malloc_pointer_loc;
extern struct fade_ctrl *pal_fade_control;
extern u8 gfxc_pokedex_diploma_background[3368];
extern u8 diploma_pal_1_and_2[64];
extern u8 lz_diploma_bg1_tilemap[1132];
extern struct obj *objects;
extern u8 box_tiles[288];
extern char *fcode_buffer2;
extern struct pokemon *partypokemon;
extern char *displayed_string;
extern u8 *hand_id_loc;
extern struct superstate *super;
extern u8 *pokemon_quanitity;
