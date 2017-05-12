#include "header/funcs.h"
const char evs[] = {0xBF,0xD0,0xE7,0xF0,0xFF};
const char ivs[] = {0xC3,0xD0,0xE7,0xF0,0xFF};
const char hp[] = {0xDC,0xE4,0xF0,0xFF};
const char atk[] = {0xD5,0xE8,0xDF,0xF0,0xFF};
const char def[] = {0xD8,0xD9,0xDA,0xF0,0xFF};
const char spd[] = {0xE7,0xE4,0xD8,0xF0,0xFF};
const char satk[] = {0xE7,0xD5,0xE8,0xF0,0xFF};
const char sdef[] = {0xE7,0xD8,0xD9,0xF0,0xFF};

void decrypt_and_print(struct pokemon *pkmn_ptr)
{
	int i,j;
	rboxid_print(3,2,evs,0,0,0,0);
	rboxid_print(3,2,ivs,0,40,0,0);
	strcpy_xFF_terminated(displayed_string,hp);
	j = pokemon_getattr(pkmn_ptr,0x1A);
	int_to_str(fcode_buffer2,j,2,3);
	gf_strcat(displayed_string,fcode_buffer2);
	/*I abandoned the spaces because the box is too small :(*/
	//i = 0xFF00;
	//gf_strcat(displayed_string,(char*)&i);
	gf_strcat(displayed_string,atk);
	j = pokemon_getattr(pkmn_ptr,0x1B);
	int_to_str(fcode_buffer2,j,2,3);
	gf_strcat(displayed_string,fcode_buffer2);
	//i = 0xFF00;
	//gf_strcat(displayed_string,(char*)&i);
	gf_strcat(displayed_string,def);
	j = pokemon_getattr(pkmn_ptr,0x1C);
	int_to_str(fcode_buffer2,j,2,3);
	gf_strcat(displayed_string,fcode_buffer2);
	rboxid_print(3,0,displayed_string,0,14,0,0);
	strcpy_xFF_terminated(displayed_string,spd);
	j = pokemon_getattr(pkmn_ptr,0x1D);
	int_to_str(fcode_buffer2,j,2,3);
	gf_strcat(displayed_string,fcode_buffer2);
	//i = 0xFF00;
	//gf_strcat(displayed_string,(char*)&i);
	gf_strcat(displayed_string,satk);
	j = pokemon_getattr(pkmn_ptr,0x1E);
	int_to_str(fcode_buffer2,j,2,3);
	gf_strcat(displayed_string,fcode_buffer2);
	//i = 0xFF00;
	//gf_strcat(displayed_string,(char*)&i);
	gf_strcat(displayed_string,sdef);
	j = pokemon_getattr(pkmn_ptr,0x1F);
	int_to_str(fcode_buffer2,j,2,3);
	gf_strcat(displayed_string,fcode_buffer2);
	rboxid_print(3,0,displayed_string,0,26,0,0);
	strcpy_xFF_terminated(displayed_string,hp);
	j = pokemon_getattr(pkmn_ptr,0x27);
	int_to_str(fcode_buffer2,j,2,2);
	gf_strcat(displayed_string,fcode_buffer2);
	i = 0xFF00;
	gf_strcat(displayed_string,(char*)&i);
	gf_strcat(displayed_string,atk);
	j = pokemon_getattr(pkmn_ptr,0x28);
	int_to_str(fcode_buffer2,j,2,2);
	gf_strcat(displayed_string,fcode_buffer2);
	i = 0xFF00;
	gf_strcat(displayed_string,(char*)&i);
	gf_strcat(displayed_string,def);
	j = pokemon_getattr(pkmn_ptr,0x29);
	int_to_str(fcode_buffer2,j,2,2);
	gf_strcat(displayed_string,fcode_buffer2);
	rboxid_print(3,0,displayed_string,0,54,0,0);
	strcpy_xFF_terminated(displayed_string,spd);
	j = pokemon_getattr(pkmn_ptr,0x2A);
	int_to_str(fcode_buffer2,j,2,2);
	gf_strcat(displayed_string,fcode_buffer2);
	i = 0xFF00;
	gf_strcat(displayed_string,(char*)&i);
	gf_strcat(displayed_string,satk);
	j = pokemon_getattr(pkmn_ptr,0x2B);
	int_to_str(fcode_buffer2,j,2,2);
	gf_strcat(displayed_string,fcode_buffer2);
	i = 0xFF00;
	gf_strcat(displayed_string,(char*)&i);
	gf_strcat(displayed_string,sdef);
	j = pokemon_getattr(pkmn_ptr,0x2C);
	int_to_str(fcode_buffer2,j,2,2);
	gf_strcat(displayed_string,fcode_buffer2);
	rboxid_print(3,0,displayed_string,0,66,0,0);
	return;
}