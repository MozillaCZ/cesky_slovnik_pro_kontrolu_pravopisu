ROOT_DIR=$(PWD)
TARGET=$(PWD)/dist

S_DIAKRITIKOU=cesky_slovnik_pro_kontrolu_pravopisu
BEZ_DIAKRITIKY=cesky_slovnik_pro_kontrolu_pravopisu_bez_diakritiky

all :: s_diakritikou bez_diakritiky

.PHONY: s_diakritikou
s_diakritikou:
	mkdir -p $(TARGET)
	zip -r $(TARGET)/$(S_DIAKRITIKOU).xpi icon.png icon64.png
	cd s_diakritikou && \
		zip -r $(TARGET)/$(S_DIAKRITIKOU).xpi dictionaries/cs_CZ/cs_CZ.aff dictionaries/cs_CZ/cs_CZ.dic manifest.json

.PHONY: bez_diakritiky
bez_diakritiky:
	mkdir -p $(TARGET)
	zip -r $(TARGET)/$(BEZ_DIAKRITIKY).xpi icon.png icon64.png
	cd bez_diakritiky && \
		zip -r $(TARGET)/$(BEZ_DIAKRITIKY).xpi dictionaries manifest.json

.PHONY: clean
clean:
	rm -rf $(TARGET)
