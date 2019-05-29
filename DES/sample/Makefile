CLANG=clang
LLVM_LINK=llvm-link
SAW=saw
LSS=lss
CFLAG=-emit-llvm
LLVM_VERIFIER=/llvm-verifier/sym-api

OBJS = DES_core.o DES_wrap.o

all: verify

DES_core.o: DES_core.c
	@echo "[+] Compile $<"
	@$(CLANG) $(CFLAG) -o $@ -c $<

DES_wrap.o: DES_wrap.c
	@echo "[+] Compile $<"
	@$(CLANG) $(CFLAG) -I${LLVM_VERIFIER} -o $@ -c $<

DES_imp.bc: $(OBJS)
	@echo "[+] Linking $@"
	@$(LLVM_LINK) -o $@ $^

DES_imp.aig: DES_imp.bc
	@echo "[+] Generate AIG File: $@"
	@lss $<
	@echo ""

verify: DES_imp.aig
	@echo "[*] Formal Verification"
	@saw DES.saw

clean:
	@rm -f DES_imp.aig DES_imp.bc $(OBJS)

