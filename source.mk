dfiles.mk: ${WAYS}
	@echo "########################################################################################"
	@echo "## DFILES"
	$(PRECMD)find . -name "*.d" -a -not -name ".#*" -a -path "*tagion*" -printf "DFILES+=%p\n" > dfiles.mk

CLEANER+=clean-dfiles

clean-dfiles:
	rm -f dfiles.mk
