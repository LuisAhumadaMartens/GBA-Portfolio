# ROM file.
TARGET_NAME := GBA-Portfolio

# C source files here, separated by spaces.
SOURCES     := main.c

# Libraries
LIBS        := -ltonc

# Tools
CC      := arm-none-eabi-gcc
OBJCOPY := arm-none-eabi-objcopy
GBAFIX  := gbafix

# Build directories
BUILD_DIR := build

# Auto-generate file names
OBJECTS := $(addprefix $(BUILD_DIR)/,$(SOURCES:.c=.o))
ELF     := $(BUILD_DIR)/$(TARGET_NAME).elf
ROM     := $(TARGET_NAME).gba

# Flags for the compiler and linker
INCLUDES := -I/opt/devkitpro/libtonc/include
LIBPATHS := -L/opt/devkitpro/libtonc/lib
CFLAGS   := -mthumb-interwork -mthumb -O2
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

# Rule to create object files from C source files.
$(BUILD_DIR)/%.o: %.c
	@mkdir -p $(@D)
	@echo "Compiling $<..."
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

# Clean rule to remove build files and the ROM.
clean:
	@echo "Cleaning up build files..."
	rm -rf $(BUILD_DIR) $(ROM)