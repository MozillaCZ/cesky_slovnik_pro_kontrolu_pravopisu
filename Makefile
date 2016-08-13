PROJECT=cesky_slovnik_pro_kontrolu_pravopisu
MKDIR=/bin/mkdir
TARGET=target
ZIPPROG=/usr/bin/zip
RM_RF=rm -rf

all :: make_xpi

package :: make_xpi

clean :: clean_all

make_xpi:
	$(MKDIR) $(TARGET) && \
	$(ZIPPROG) -r $(TARGET)/$(PROJECT).xpi dictionaries icon.png icon64.png install.rdf && cd ..

clean_all:
	$(RM_RF) $(TARGET)

