/*
 * This file is part of the coreboot project.
 *
 * Copyright (C) 2014 Google, Inc.
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
#ifndef VBOOT_COMMON_H
#define VBOOT_COMMON_H

#include <stdint.h>
#include <region.h>

/* The FW areas consist of multiple components. At the beginning of
 * each area is the number of total compoments as well as the size and
 * offset for each component. One needs to caculate the total size of the
 * signed firmware region based off of the embedded metadata. */
struct vboot_component_entry {
	uint32_t offset;
	uint32_t size;
} __attribute__((packed));

struct vboot_components {
	uint32_t num_components;
	struct vboot_component_entry entries[0];
} __attribute__((packed));

/* The following functions return 0 on success, < 0 on error. */
int vboot_named_region_device(const char *name, struct region_device *rdev);
int vboot_region_device(const struct region *reg, struct region_device *rdev);

#endif /* VBOOT_COMMON_H */
