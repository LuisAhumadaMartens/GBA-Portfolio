# ROM file
TARGET_NAME := GBA-Portfolio

# Build directories
BUILD_DIR := build

# C Source Files
SOURCES     := $(shell find . -name '*.c')

# Libraries
LIBS        := -ltonc

# Tools
CC      := arm-none-eabi-gcc
OBJCOPY := arm-none-eabi-objcopy
GBAFIX  := gbafix

# Auto-generate file paths
OBJECTS     := $(SOURCES:%.c=$(BUILD_DIR)/%.o)
ELF         := $(BUILD_DIR)/$(TARGET_NAME).elf
ROM         := $(TARGET_NAME).gba

# Flags for the compiler and linker
INCLUDES := -I. -I/opt/devkitpro/libtonc/include
LIBPATHS := -L/opt/devkitpro/libtonc/lib
CFLAGS   := -mthumb-interwork -mthumb -O2 $(INCLUDES)
LDFLAGS  := -mthumb-interwork -mthumb -specs=gba.specs

# Build ROM
all: $(ROM)

# Rule to create the .gba ROM from the .elf file
$(ROM): $(ELF)
	@echo "Converting ELF to GBA ROM..."
	$(OBJCOPY) -O binary $< $@
	$(GBAFIX) $@
	@echo "Build successful! $(ROM) created."

# Rule to create the .elf file from the object files
$(ELF): $(OBJECTS)
	@echo "Linking object files..."
	$(CC) $(LDFLAGS) $^ $(LIBPATHS) $(LIBS) -o $@

# Rule to create object files from C source files
$(BUILD_DIR)/%.o: %.c
	@mkdir -p $(@D)
	@echo "Compiling $<..."
	$(CC) $(CFLAGS) -c $< -o $@

# Rule to clean up all generated files.
clean:
	@echo "Cleaning up build files..."
	rm -rf $(BUILD_DIR) $(ROM)

# Clean rule to remove all build files, the ROM, and save files
clean-all: clean
	rm -rf $(ROM:.gba=.sav)

# Phony targets are not actual files.
.PHONY: clean-all