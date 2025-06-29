#include <tonc.h>
#include "scenes/office/office.h"

int main()
{
	tte_init_se_default(0, BG_CBB(0) | BG_SBB(31));
	tte_set_pos(78, 72);
	tte_write("Press START or (A)");

	REG_DISPCNT = DCNT_MODE0 | DCNT_BG0;

	while(1)
	{
		vid_vsync();
		key_poll();

		if(key_hit(KEY_START) || key_hit(KEY_A))
		{
			office_main();
			break;
		}
	}

	return 0;
}
