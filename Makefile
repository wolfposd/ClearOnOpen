
DEBUG = 0
RELEASE = 1
PACKAGE_VERSION = $(THEOS_PACKAGE_BASE_VERSION)

ARCHS = armv7 arm64
include theos/makefiles/common.mk

TWEAK_NAME = ClearOnOpen
ClearOnOpen_FILES = Tweak.xm
ClearOnOpen_LDFLAGS += -Wl,-segalign,4000
ClearOnOpen_CODESIGN_FLAGS = -S
ClearOnOpen_CFLAGS = -fobjc-arc -Wno-deprecated-declarations
ClearOnOpen_USE_SUBSTRATE = 0


include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 backboardd"
