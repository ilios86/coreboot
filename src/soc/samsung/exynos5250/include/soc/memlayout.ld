/*
 * This file is part of the coreboot project.
 *
 * Copyright 2014 Google Inc.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 2 of the License.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc.
 */

#include <memlayout.h>

#include <arch/header.ld>

/*
 * Note: The BootROM loads the 8K BL1 at [0x2020000:0x2022000), so the bootblock
 * must be placed after that. After the handoff, the space can be reclaimed.
 */

SECTIONS
{
	SRAM_START(0x2020000)
	/* 13K hole, includes BL1 */
	BOOTBLOCK(0x2023400, 32K)
	/* 19K hole */
	ROMSTAGE(0x2030000, 128K)
	/* 32K hole */
	TTB(0x2058000, 16K)
	PRERAM_CBFS_CACHE(0x205C000, 96K)
	STACK(0x2074000, 16K)
	SRAM_END(0x2078000)

	DRAM_START(0x40000000)
	RAMSTAGE(0x40000000, 128K)
	POSTRAM_CBFS_CACHE(0x41000000, 8M)
	DMA_COHERENT(0x77300000, 1M)
}
