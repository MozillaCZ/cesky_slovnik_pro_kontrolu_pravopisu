S_DIAKRITIKOU=cesky_slovnik_pro_kontrolu_pravopisu
BEZ_DIAKRITIKY=cesky_slovnik_pro_kontrolu_pravopisu_bez_diakritiky
MKDIR=mkdir -p
TARGET=dist
ZIPPROG=zip
RM_RF=rm -rf

all :: make_xpi_s_diakritikou make_xpi_bez_diakritiky

package :: make_xpi_s_diakritikou make_xpi_bez_diakritiky

clean :: clean_all

make_xpi_s_diakritikou:
	$(MKDIR) $(TARGET)
	$(ZIPPROG) -r $(TARGET)/$(S_DIAKRITIKOU).xpi icon.png icon64.png
	cd s_diakritikou && \
	$(ZIPPROG) -r ../$(TARGET)/$(S_DIAKRITIKOU).xpi dictionaries manifest.json

make_xpi_bez_diakritiky:
	$(MKDIR) $(TARGET)
	$(ZIPPROG) -r $(TARGET)/$(BEZ_DIAKRITIKY).xpi icon.png icon64.png
	cd bez_diakritiky && \
	$(ZIPPROG) -r ../$(TARGET)/$(BEZ_DIAKRITIKY).xpi dictionaries manifest.json

clean_all:
	$(RM_RF) $(TARGET)
