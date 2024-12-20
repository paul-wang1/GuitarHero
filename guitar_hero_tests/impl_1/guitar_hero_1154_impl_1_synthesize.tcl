if {[catch {

# define run engine funtion
source [file join {C:/lscc/radiant/2023.1} scripts tcl flow run_engine.tcl]
# define global variables
global para
set para(gui_mode) 1
set para(prj_dir) "Z:/guitar_hero_tests"
# synthesize IPs
# synthesize VMs
# propgate constraints
file delete -force -- guitar_hero_1154_impl_1_cpe.ldc
run_engine_newmsg cpe -f "guitar_hero_1154_impl_1.cprj" "pll1.cprj" -a "iCE40UP"  -o guitar_hero_1154_impl_1_cpe.ldc
# synthesize top design
file delete -force -- guitar_hero_1154_impl_1.vm guitar_hero_1154_impl_1.ldc
run_engine_newmsg synthesis -f "guitar_hero_1154_impl_1_lattice.synproj"
run_postsyn [list -a iCE40UP -p iCE40UP5K -t SG48 -sp High-Performance_1.2V -oc Industrial -top -w -o guitar_hero_1154_impl_1_syn.udb guitar_hero_1154_impl_1.vm] "Z:/guitar_hero_tests/impl_1/guitar_hero_1154_impl_1.ldc"

} out]} {
   runtime_log $out
   exit 1
}
