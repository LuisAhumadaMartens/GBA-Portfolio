#include <tonc.h>
#include <string.h>

const u32 dot_tile[8] =
{
	0x01111110, 0x11111111, 0x11111111, 0x11111111,
	0x11111111, 0x11111111, 0x11111111, 0x01111110,
};

const u16 dot_palette[2] = { 0, CLR_BLUE };

void office_main()
{
    oam_init(oam_mem, 128);

	memcpy(tile_mem[4], dot_tile, sizeof(dot_tile));
	memcpy(pal_obj_mem, dot_palette, sizeof(dot_palette));

	REG_DISPCNT = DCNT_MODE0 | DCNT_OBJ | DCNT_OBJ_1D;

	OBJ_ATTR *dot_sprite = &oam_mem[0];
	obj_set_attr(dot_sprite,
		ATTR0_SQUARE,
		ATTR1_SIZE_8x8,
		ATTR2_PALBANK(0) | 0);

	int x = 120;
	int y = 80;
	obj_set_pos(dot_sprite, x, y);

	while(1)
	{
		vid_vsync();
		key_poll();

		x += key_tri_horz();
		y += key_tri_vert();

		obj_set_pos(dot_sprite, x, y);
	}
}
