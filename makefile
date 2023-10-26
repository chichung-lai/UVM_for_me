.PHONY:vcs sim verdi clean

#VCS = vcs -f filelist.f \
#	-timescale=1ns/1ps \
#	-full64 \
#	-R \
#	-debug_acc+all \
#	-fsdb \
#	-lca -kdb \
#	-ntb_opts uvm-1.1 \
#	-sverilog \
#	+v2k

#VCS =	vcs +acc +vpi -sverilog /home/ICer/Documents/uvm-1.1d/src/dpi/uvm_dpi.cc -CFLAGS -timescale=1ns/1ps -f filelist.f -lca -kdb  -fsdb -DVCS 

#VCS =	vcs -debug_access+r+w+nomemcbk +v2k -R -nc -debug_pp +vpi -sverilog /home/ICer/Documents/uvm-1.1d/src/dpi/uvm_dpi.cc -CFLAGS -DVCS -timescale=1ns/1ps -f filelist.f -lca -kdb +define+FSDB -fsdb_old -P ${VERDI_HOME}/share/PLI/VCS/LINUX64/novas.tab ${VERDI_HOME}/share/PLI/VCS/LINUX64/pli.a -full64

VCS =	vcs +acc +vpi -sverilog /home/ICer/Documents/uvm-1.1d/src/dpi/uvm_dpi.cc -CFLAGS -DVCS -timescale=1ns/1ps -f filelist.f -lca -kdb +define+FSDB -fsdb -full64

vcs:
	${VCS}

sim:
	./simv -gui

verdi:
	verdi -ssf tb.fsdb &

clean:
	rm -rf csrc verdiLog simv.daidir \
	novas.* \
	vc_hdrs.h \
	simv \
	*.key \
	*.fsdb \
	*.log \
	inter.vpd \
	DVEfiles

#initial begin
#    $fsdbDumpfile("tb.fsdb");
#    $fsdbDumpvars;
#end
