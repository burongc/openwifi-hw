#*****************************************************************************************
# Xianjun jiao. putaoshu@msn.com; xianjun.jiao@imec.be;
# Based on Xilinx vivado exported .tcl
#*****************************************************************************************

# -----------generate fpga_scale.v---------------
set  fd  [open  "./src/fpga_scale.v"  w]
puts $fd "`define FDSAFDASFDA 1"
close $fd
# ----end of generate fpga_scale.v---------------

# Set the reference directory for source file relative paths (by default the value is script directory path)
set origin_dir "."

# Use origin directory path location variable, if specified in the tcl shell
if { [info exists ::origin_dir_loc] } {
  set origin_dir $::origin_dir_loc
}

# Set the project name
set project_name "side_ch_big"

# Use project name variable, if specified in the tcl shell
if { [info exists ::user_project_name] } {
  set project_name $::user_project_name
}

variable script_file
set script_file "side_ch_big.tcl"

# Help information for this script
proc help {} {
  variable script_file
  puts "\nDescription:"
  puts "Recreate a Vivado project from this script. The created project will be"
  puts "functionally equivalent to the original project for which this script was"
  puts "generated. The script contains commands for creating a project, filesets,"
  puts "runs, adding/importing sources and setting properties on various objects.\n"
  puts "Syntax:"
  puts "$script_file"
  puts "$script_file -tclargs \[--origin_dir <path>\]"
  puts "$script_file -tclargs \[--project_name <name>\]"
  puts "$script_file -tclargs \[--help\]\n"
  puts "Usage:"
  puts "Name                   Description"
  puts "-------------------------------------------------------------------------"
  puts "\[--origin_dir <path>\]  Determine source file paths wrt this path. Default"
  puts "                       origin_dir path value is \".\", otherwise, the value"
  puts "                       that was set with the \"-paths_relative_to\" switch"
  puts "                       when this script was generated.\n"
  puts "\[--project_name <name>\] Create project with the specified name. Default"
  puts "                       name is the name of the project from where this"
  puts "                       script was generated.\n"
  puts "\[--help\]               Print help information for this script"
  puts "-------------------------------------------------------------------------\n"
  exit 0
}

if { $::argc > 0 } {
  for {set i 0} {$i < [llength $::argc]} {incr i} {
    set option [string trim [lindex $::argv $i]]
    switch -regexp -- $option {
      "--origin_dir"   { incr i; set origin_dir [lindex $::argv $i] }
      "--project_name" { incr i; set project_name [lindex $::argv $i] }
      "--help"         { help }
      default {
        if { [regexp {^-} $option] } {
          puts "ERROR: Unknown option '$option' specified, please type '$script_file -tclargs --help' for usage info.\n"
          return 1
        }
      }
    }
  }
}

# Set the directory path for the original project from where this script was exported
set orig_proj_dir "[file normalize "$origin_dir/side_ch_big"]"

# Create project
create_project ${project_name} ./${project_name} -part xc7z045ffg900-2

# Set the directory path for the new project
set proj_dir [get_property directory [current_project]]

# Reconstruct message rules
# None

# Set project properties
set obj [current_project]
set_property -name "board_connections" -value "" -objects $obj
set_property -name "board_part" -value "xilinx.com:zc706:part0:1.4" -objects $obj
set_property -name "compxlib.activehdl_compiled_library_dir" -value "$proj_dir/${project_name}.cache/compile_simlib/activehdl" -objects $obj
set_property -name "compxlib.funcsim" -value "1" -objects $obj
set_property -name "compxlib.ies_compiled_library_dir" -value "$proj_dir/${project_name}.cache/compile_simlib/ies" -objects $obj
set_property -name "compxlib.modelsim_compiled_library_dir" -value "$proj_dir/${project_name}.cache/compile_simlib/modelsim" -objects $obj
set_property -name "compxlib.overwrite_libs" -value "0" -objects $obj
set_property -name "compxlib.questa_compiled_library_dir" -value "$proj_dir/${project_name}.cache/compile_simlib/questa" -objects $obj
set_property -name "compxlib.riviera_compiled_library_dir" -value "$proj_dir/${project_name}.cache/compile_simlib/riviera" -objects $obj
set_property -name "compxlib.timesim" -value "1" -objects $obj
set_property -name "compxlib.vcs_compiled_library_dir" -value "$proj_dir/${project_name}.cache/compile_simlib/vcs" -objects $obj
set_property -name "compxlib.xsim_compiled_library_dir" -value "" -objects $obj
set_property -name "corecontainer.enable" -value "0" -objects $obj
set_property -name "default_lib" -value "xil_defaultlib" -objects $obj
set_property -name "dsa.num_compute_units" -value "60" -objects $obj
set_property -name "dsa.rom.debug_type" -value "0" -objects $obj
set_property -name "dsa.rom.prom_type" -value "0" -objects $obj
set_property -name "enable_optional_runs_sta" -value "0" -objects $obj
set_property -name "generate_ip_upgrade_log" -value "1" -objects $obj
set_property -name "ip_cache_permissions" -value "read write" -objects $obj
set_property -name "ip_interface_inference_priority" -value "" -objects $obj
set_property -name "ip_output_repo" -value "$proj_dir/${project_name}.cache/ip" -objects $obj
set_property -name "project_type" -value "Default" -objects $obj
set_property -name "pr_flow" -value "0" -objects $obj
set_property -name "sim.ip.auto_export_scripts" -value "1" -objects $obj
set_property -name "sim.use_ip_compiled_libs" -value "1" -objects $obj
set_property -name "simulator_language" -value "Mixed" -objects $obj
set_property -name "source_mgmt_mode" -value "All" -objects $obj
set_property -name "target_language" -value "Verilog" -objects $obj
set_property -name "target_simulator" -value "XSim" -objects $obj
set_property -name "xpm_libraries" -value "XPM_CDC XPM_MEMORY" -objects $obj
set_property -name "xsim.array_display_limit" -value "1024" -objects $obj
set_property -name "xsim.radix" -value "hex" -objects $obj
set_property -name "xsim.time_unit" -value "ns" -objects $obj
set_property -name "xsim.trace_limit" -value "65536" -objects $obj

# Create 'sources_1' fileset (if not found)
if {[string equal [get_filesets -quiet sources_1] ""]} {
  create_fileset -srcset sources_1
}

# Rebuild user ip_repo's index before adding any source files
update_ip_catalog -rebuild

# Set 'sources_1' fileset object
#  "[file normalize "$origin_dir/../../ip_repo/common/fifo64_1clk/src/fifo64_1clk_fifo_generator_0_0/fifo64_1clk_fifo_generator_0_0.xci"]"
#  "[file normalize "$origin_dir/../../ip_repo/common/fifo64_1clk/src/fifo64_1clk.v"]"
#  "[file normalize "$origin_dir/../../ip_repo/common/fifo64_1clk_dep512/src/fifo64_1clk_dep512_fifo_generator_0_0/fifo64_1clk_dep512_fifo_generator_0_0.xci"]"
#  "[file normalize "$origin_dir/../../ip_repo/common/fifo64_1clk_dep512/src/fifo64_1clk_dep512.v"]"
#  "[file normalize "$origin_dir/src/side_ch_s_axis.v"]"
set obj [get_filesets sources_1]
set files [list \
 "[file normalize "$origin_dir/src/ram_2port.v"]"\
 "[file normalize "$origin_dir/src/side_ch_control.v"]"\
 "[file normalize "$origin_dir/src/side_ch_m_axis.v"]"\
 "[file normalize "$origin_dir/src/side_ch_s_axi.v"]"\
 "[file normalize "$origin_dir/src/side_ch.v"]"\
]
add_files -norecurse -fileset $obj $files

# Set 'sources_1' fileset file properties for remote files
# set file "$origin_dir/../../ip_repo/common/fifo64_1clk/src/fifo64_1clk_fifo_generator_0_0/fifo64_1clk_fifo_generator_0_0.xci"
# set file [file normalize $file]
# set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
# if { ![get_property "is_locked" $file_obj] } {
#   set_property -name "generate_synth_checkpoint" -value "1" -objects $file_obj
# }
# set_property -name "is_enabled" -value "1" -objects $file_obj
# set_property -name "is_global_include" -value "0" -objects $file_obj
# set_property -name "library" -value "xil_defaultlib" -objects $file_obj
# set_property -name "path_mode" -value "RelativeFirst" -objects $file_obj
# set_property -name "used_in" -value "synthesis implementation simulation" -objects $file_obj
# set_property -name "used_in_implementation" -value "1" -objects $file_obj
# set_property -name "used_in_simulation" -value "1" -objects $file_obj
# set_property -name "used_in_synthesis" -value "1" -objects $file_obj

# set file "$origin_dir/../../ip_repo/common/fifo64_1clk/src/fifo64_1clk.v"
# set file [file normalize $file]
# set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
# set_property -name "file_type" -value "Verilog" -objects $file_obj
# set_property -name "is_enabled" -value "1" -objects $file_obj
# set_property -name "is_global_include" -value "0" -objects $file_obj
# set_property -name "library" -value "xil_defaultlib" -objects $file_obj
# set_property -name "path_mode" -value "RelativeFirst" -objects $file_obj
# set_property -name "used_in" -value "synthesis implementation simulation" -objects $file_obj
# set_property -name "used_in_implementation" -value "1" -objects $file_obj
# set_property -name "used_in_simulation" -value "1" -objects $file_obj
# set_property -name "used_in_synthesis" -value "1" -objects $file_obj

# set file "$origin_dir/../../ip_repo/common/fifo64_1clk_dep512/src/fifo64_1clk_dep512_fifo_generator_0_0/fifo64_1clk_dep512_fifo_generator_0_0.xci"
# set file [file normalize $file]
# set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
# if { ![get_property "is_locked" $file_obj] } {
#   set_property -name "generate_synth_checkpoint" -value "1" -objects $file_obj
# }
# set_property -name "is_enabled" -value "1" -objects $file_obj
# set_property -name "is_global_include" -value "0" -objects $file_obj
# set_property -name "library" -value "xil_defaultlib" -objects $file_obj
# set_property -name "path_mode" -value "RelativeFirst" -objects $file_obj
# set_property -name "used_in" -value "synthesis implementation simulation" -objects $file_obj
# set_property -name "used_in_implementation" -value "1" -objects $file_obj
# set_property -name "used_in_simulation" -value "1" -objects $file_obj
# set_property -name "used_in_synthesis" -value "1" -objects $file_obj

# set file "$origin_dir/../../ip_repo/common/fifo64_1clk_dep512/src/fifo64_1clk_dep512.v"
# set file [file normalize $file]
# set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
# set_property -name "file_type" -value "Verilog" -objects $file_obj
# set_property -name "is_enabled" -value "1" -objects $file_obj
# set_property -name "is_global_include" -value "0" -objects $file_obj
# set_property -name "library" -value "xil_defaultlib" -objects $file_obj
# set_property -name "path_mode" -value "RelativeFirst" -objects $file_obj
# set_property -name "used_in" -value "synthesis implementation simulation" -objects $file_obj
# set_property -name "used_in_implementation" -value "1" -objects $file_obj
# set_property -name "used_in_simulation" -value "1" -objects $file_obj
# set_property -name "used_in_synthesis" -value "1" -objects $file_obj

# set file "$origin_dir/src/side_ch_s_axis.v"
# set file [file normalize $file]
# set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
# set_property -name "file_type" -value "Verilog" -objects $file_obj
# set_property -name "is_enabled" -value "1" -objects $file_obj
# set_property -name "is_global_include" -value "0" -objects $file_obj
# set_property -name "library" -value "xil_defaultlib" -objects $file_obj
# set_property -name "path_mode" -value "RelativeFirst" -objects $file_obj
# set_property -name "used_in" -value "synthesis implementation simulation" -objects $file_obj
# set_property -name "used_in_implementation" -value "1" -objects $file_obj
# set_property -name "used_in_simulation" -value "1" -objects $file_obj
# set_property -name "used_in_synthesis" -value "1" -objects $file_obj

set file "$origin_dir/src/ram_2port.v"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "Verilog" -objects $file_obj
set_property -name "is_enabled" -value "1" -objects $file_obj
set_property -name "is_global_include" -value "0" -objects $file_obj
set_property -name "library" -value "xil_defaultlib" -objects $file_obj
set_property -name "path_mode" -value "RelativeFirst" -objects $file_obj
set_property -name "used_in" -value "synthesis implementation simulation" -objects $file_obj
set_property -name "used_in_implementation" -value "1" -objects $file_obj
set_property -name "used_in_simulation" -value "1" -objects $file_obj
set_property -name "used_in_synthesis" -value "1" -objects $file_obj

set file "$origin_dir/src/side_ch_control.v"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "Verilog" -objects $file_obj
set_property -name "is_enabled" -value "1" -objects $file_obj
set_property -name "is_global_include" -value "0" -objects $file_obj
set_property -name "library" -value "xil_defaultlib" -objects $file_obj
set_property -name "path_mode" -value "RelativeFirst" -objects $file_obj
set_property -name "used_in" -value "synthesis implementation simulation" -objects $file_obj
set_property -name "used_in_implementation" -value "1" -objects $file_obj
set_property -name "used_in_simulation" -value "1" -objects $file_obj
set_property -name "used_in_synthesis" -value "1" -objects $file_obj

set file "$origin_dir/src/side_ch_m_axis.v"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "Verilog" -objects $file_obj
set_property -name "is_enabled" -value "1" -objects $file_obj
set_property -name "is_global_include" -value "0" -objects $file_obj
set_property -name "library" -value "xil_defaultlib" -objects $file_obj
set_property -name "path_mode" -value "RelativeFirst" -objects $file_obj
set_property -name "used_in" -value "synthesis implementation simulation" -objects $file_obj
set_property -name "used_in_implementation" -value "1" -objects $file_obj
set_property -name "used_in_simulation" -value "1" -objects $file_obj
set_property -name "used_in_synthesis" -value "1" -objects $file_obj

set file "$origin_dir/src/side_ch_s_axi.v"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "Verilog" -objects $file_obj
set_property -name "is_enabled" -value "1" -objects $file_obj
set_property -name "is_global_include" -value "0" -objects $file_obj
set_property -name "library" -value "xil_defaultlib" -objects $file_obj
set_property -name "path_mode" -value "RelativeFirst" -objects $file_obj
set_property -name "used_in" -value "synthesis implementation simulation" -objects $file_obj
set_property -name "used_in_implementation" -value "1" -objects $file_obj
set_property -name "used_in_simulation" -value "1" -objects $file_obj
set_property -name "used_in_synthesis" -value "1" -objects $file_obj

set file "$origin_dir/src/side_ch.v"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "Verilog" -objects $file_obj
set_property -name "is_enabled" -value "1" -objects $file_obj
set_property -name "is_global_include" -value "0" -objects $file_obj
set_property -name "library" -value "xil_defaultlib" -objects $file_obj
set_property -name "path_mode" -value "RelativeFirst" -objects $file_obj
set_property -name "used_in" -value "synthesis implementation simulation" -objects $file_obj
set_property -name "used_in_implementation" -value "1" -objects $file_obj
set_property -name "used_in_simulation" -value "1" -objects $file_obj
set_property -name "used_in_synthesis" -value "1" -objects $file_obj

# Set 'sources_1' fileset file properties for local files
# None

# Set 'sources_1' fileset properties
set obj [get_filesets sources_1]
set_property -name "design_mode" -value "RTL" -objects $obj
set_property -name "edif_extra_search_paths" -value "" -objects $obj
set_property -name "elab_link_dcps" -value "1" -objects $obj
set_property -name "elab_load_timing_constraints" -value "1" -objects $obj
set_property -name "generic" -value "" -objects $obj
set_property -name "include_dirs" -value "" -objects $obj
set_property -name "lib_map_file" -value "" -objects $obj
set_property -name "loop_count" -value "1000" -objects $obj
set_property -name "name" -value "sources_1" -objects $obj
set_property -name "top" -value "side_ch" -objects $obj
set_property -name "verilog_define" -value "" -objects $obj
set_property -name "verilog_uppercase" -value "0" -objects $obj

# Create 'constrs_1' fileset (if not found)
if {[string equal [get_filesets -quiet constrs_1] ""]} {
  create_fileset -constrset constrs_1
}

# Set 'constrs_1' fileset object
set obj [get_filesets constrs_1]

# Empty (no sources present)

# Set 'constrs_1' fileset properties
set obj [get_filesets constrs_1]
set_property -name "name" -value "constrs_1" -objects $obj
set_property -name "target_constrs_file" -value "" -objects $obj

# Create 'sim_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_1] ""]} {
  create_fileset -simset sim_1
}

# Set 'sim_1' fileset object
set obj [get_filesets sim_1]
# Empty (no sources present)

# Set 'sim_1' fileset properties
set obj [get_filesets sim_1]
set_property -name "32bit" -value "0" -objects $obj
set_property -name "generic" -value "" -objects $obj
set_property -name "include_dirs" -value "" -objects $obj
set_property -name "incremental" -value "1" -objects $obj
set_property -name "name" -value "sim_1" -objects $obj
set_property -name "nl.cell" -value "" -objects $obj
set_property -name "nl.incl_unisim_models" -value "0" -objects $obj
set_property -name "nl.process_corner" -value "slow" -objects $obj
set_property -name "nl.rename_top" -value "" -objects $obj
set_property -name "nl.sdf_anno" -value "1" -objects $obj
set_property -name "nl.write_all_overrides" -value "0" -objects $obj
set_property -name "source_set" -value "sources_1" -objects $obj
set_property -name "top" -value "side_ch" -objects $obj
set_property -name "transport_int_delay" -value "0" -objects $obj
set_property -name "transport_path_delay" -value "0" -objects $obj
set_property -name "verilog_define" -value "" -objects $obj
set_property -name "verilog_uppercase" -value "0" -objects $obj
set_property -name "xelab.dll" -value "0" -objects $obj
set_property -name "xsim.compile.tcl.pre" -value "" -objects $obj
set_property -name "xsim.compile.xvhdl.more_options" -value "" -objects $obj
set_property -name "xsim.compile.xvhdl.nosort" -value "1" -objects $obj
set_property -name "xsim.compile.xvhdl.relax" -value "1" -objects $obj
set_property -name "xsim.compile.xvlog.more_options" -value "" -objects $obj
set_property -name "xsim.compile.xvlog.nosort" -value "1" -objects $obj
set_property -name "xsim.compile.xvlog.relax" -value "1" -objects $obj
set_property -name "xsim.elaborate.debug_level" -value "typical" -objects $obj
set_property -name "xsim.elaborate.load_glbl" -value "1" -objects $obj
set_property -name "xsim.elaborate.mt_level" -value "auto" -objects $obj
set_property -name "xsim.elaborate.rangecheck" -value "0" -objects $obj
set_property -name "xsim.elaborate.relax" -value "1" -objects $obj
set_property -name "xsim.elaborate.sdf_delay" -value "sdfmax" -objects $obj
set_property -name "xsim.elaborate.snapshot" -value "" -objects $obj
set_property -name "xsim.elaborate.xelab.more_options" -value "" -objects $obj
set_property -name "xsim.simulate.custom_tcl" -value "" -objects $obj
set_property -name "xsim.simulate.log_all_signals" -value "0" -objects $obj
set_property -name "xsim.simulate.runtime" -value "1000ns" -objects $obj
set_property -name "xsim.simulate.saif" -value "" -objects $obj
set_property -name "xsim.simulate.saif_all_signals" -value "0" -objects $obj
set_property -name "xsim.simulate.saif_scope" -value "" -objects $obj
set_property -name "xsim.simulate.tcl.post" -value "" -objects $obj
set_property -name "xsim.simulate.wdb" -value "" -objects $obj
set_property -name "xsim.simulate.xsim.more_options" -value "" -objects $obj

# Create 'synth_1' run (if not found)
if {[string equal [get_runs -quiet synth_1] ""]} {
    create_run -name synth_1 -part xc7z045ffg900-2 -flow {Vivado Synthesis 2018} -strategy "Vivado Synthesis Defaults" -report_strategy {No Reports} -constrset constrs_1
} else {
  set_property strategy "Vivado Synthesis Defaults" [get_runs synth_1]
  set_property flow "Vivado Synthesis 2018" [get_runs synth_1]
}
set obj [get_runs synth_1]
set_property set_report_strategy_name 1 $obj
set_property report_strategy {Vivado Synthesis Default Reports} $obj
set_property set_report_strategy_name 0 $obj
# Create 'synth_1_synth_report_utilization_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs synth_1] synth_1_synth_report_utilization_0] "" ] } {
  create_report_config -report_name synth_1_synth_report_utilization_0 -report_type report_utilization:1.0 -steps synth_design -runs synth_1
}
set obj [get_report_configs -of_objects [get_runs synth_1] synth_1_synth_report_utilization_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "1" -objects $obj
set_property -name "options.pblocks" -value "" -objects $obj
set_property -name "options.cells" -value "" -objects $obj
set_property -name "options.slr" -value "0" -objects $obj
set_property -name "options.packthru" -value "0" -objects $obj
set_property -name "options.hierarchical" -value "0" -objects $obj
set_property -name "options.hierarchical_depth" -value "" -objects $obj
set_property -name "options.hierarchical_percentages" -value "0" -objects $obj
set_property -name "options.more_options" -value "" -objects $obj

}
set obj [get_runs synth_1]
set_property -name "constrset" -value "constrs_1" -objects $obj
set_property -name "description" -value "Vivado Synthesis Defaults" -objects $obj
set_property -name "flow" -value "Vivado Synthesis 2018" -objects $obj
set_property -name "name" -value "synth_1" -objects $obj
set_property -name "needs_refresh" -value "0" -objects $obj
set_property -name "srcset" -value "sources_1" -objects $obj
# set_property -name "incremental_checkpoint" -value "" -objects $obj
set_property -name "include_in_archive" -value "1" -objects $obj
set_property -name "strategy" -value "Vivado Synthesis Defaults" -objects $obj
set_property -name "steps.synth_design.tcl.pre" -value "" -objects $obj
set_property -name "steps.synth_design.tcl.post" -value "" -objects $obj
set_property -name "steps.synth_design.args.flatten_hierarchy" -value "rebuilt" -objects $obj
set_property -name "steps.synth_design.args.gated_clock_conversion" -value "off" -objects $obj
set_property -name "steps.synth_design.args.bufg" -value "12" -objects $obj
set_property -name "steps.synth_design.args.fanout_limit" -value "10000" -objects $obj
set_property -name "steps.synth_design.args.directive" -value "Default" -objects $obj
set_property -name "steps.synth_design.args.retiming" -value "0" -objects $obj
set_property -name "steps.synth_design.args.fsm_extraction" -value "auto" -objects $obj
set_property -name "steps.synth_design.args.keep_equivalent_registers" -value "0" -objects $obj
set_property -name "steps.synth_design.args.resource_sharing" -value "auto" -objects $obj
set_property -name "steps.synth_design.args.control_set_opt_threshold" -value "auto" -objects $obj
set_property -name "steps.synth_design.args.no_lc" -value "0" -objects $obj
set_property -name "steps.synth_design.args.no_srlextract" -value "0" -objects $obj
set_property -name "steps.synth_design.args.shreg_min_size" -value "3" -objects $obj
set_property -name "steps.synth_design.args.max_bram" -value "-1" -objects $obj
set_property -name "steps.synth_design.args.max_uram" -value "-1" -objects $obj
set_property -name "steps.synth_design.args.max_dsp" -value "-1" -objects $obj
set_property -name "steps.synth_design.args.max_bram_cascade_height" -value "-1" -objects $obj
set_property -name "steps.synth_design.args.max_uram_cascade_height" -value "-1" -objects $obj
set_property -name "steps.synth_design.args.cascade_dsp" -value "auto" -objects $obj
set_property -name "steps.synth_design.args.assert" -value "0" -objects $obj
set_property -name "steps.synth_design.args.more options" -value "" -objects $obj

# set the current synth run
current_run -synthesis [get_runs synth_1]

# Create 'impl_1' run (if not found)
if {[string equal [get_runs -quiet impl_1] ""]} {
    create_run -name impl_1 -part xc7z045ffg900-2 -flow {Vivado Implementation 2018} -strategy "Vivado Implementation Defaults" -report_strategy {No Reports} -constrset constrs_1 -parent_run synth_1
} else {
  set_property strategy "Vivado Implementation Defaults" [get_runs impl_1]
  set_property flow "Vivado Implementation 2018" [get_runs impl_1]
}
set obj [get_runs impl_1]
set_property set_report_strategy_name 1 $obj
set_property report_strategy {Vivado Implementation Default Reports} $obj
set_property set_report_strategy_name 0 $obj
# Create 'impl_1_init_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_init_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_init_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps init_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_init_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.check_timing_verbose" -value "0" -objects $obj
set_property -name "options.delay_type" -value "" -objects $obj
set_property -name "options.setup" -value "0" -objects $obj
set_property -name "options.hold" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj
set_property -name "options.nworst" -value "" -objects $obj
set_property -name "options.unique_pins" -value "0" -objects $obj
set_property -name "options.path_type" -value "" -objects $obj
set_property -name "options.slack_lesser_than" -value "" -objects $obj
set_property -name "options.report_unconstrained" -value "0" -objects $obj
set_property -name "options.warn_on_violation" -value "0" -objects $obj
set_property -name "options.significant_digits" -value "" -objects $obj
set_property -name "options.cell" -value "" -objects $obj
set_property -name "options.more_options" -value "" -objects $obj

}
# Create 'impl_1_opt_report_drc_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_opt_report_drc_0] "" ] } {
  create_report_config -report_name impl_1_opt_report_drc_0 -report_type report_drc:1.0 -steps opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_opt_report_drc_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "1" -objects $obj
set_property -name "options.upgrade_cw" -value "0" -objects $obj
set_property -name "options.checks" -value "" -objects $obj
set_property -name "options.ruledecks" -value "" -objects $obj
set_property -name "options.more_options" -value "" -objects $obj

}
# Create 'impl_1_opt_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_opt_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_opt_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_opt_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.check_timing_verbose" -value "0" -objects $obj
set_property -name "options.delay_type" -value "" -objects $obj
set_property -name "options.setup" -value "0" -objects $obj
set_property -name "options.hold" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj
set_property -name "options.nworst" -value "" -objects $obj
set_property -name "options.unique_pins" -value "0" -objects $obj
set_property -name "options.path_type" -value "" -objects $obj
set_property -name "options.slack_lesser_than" -value "" -objects $obj
set_property -name "options.report_unconstrained" -value "0" -objects $obj
set_property -name "options.warn_on_violation" -value "0" -objects $obj
set_property -name "options.significant_digits" -value "" -objects $obj
set_property -name "options.cell" -value "" -objects $obj
set_property -name "options.more_options" -value "" -objects $obj

}
# Create 'impl_1_power_opt_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_power_opt_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_power_opt_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps power_opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_power_opt_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.check_timing_verbose" -value "0" -objects $obj
set_property -name "options.delay_type" -value "" -objects $obj
set_property -name "options.setup" -value "0" -objects $obj
set_property -name "options.hold" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj
set_property -name "options.nworst" -value "" -objects $obj
set_property -name "options.unique_pins" -value "0" -objects $obj
set_property -name "options.path_type" -value "" -objects $obj
set_property -name "options.slack_lesser_than" -value "" -objects $obj
set_property -name "options.report_unconstrained" -value "0" -objects $obj
set_property -name "options.warn_on_violation" -value "0" -objects $obj
set_property -name "options.significant_digits" -value "" -objects $obj
set_property -name "options.cell" -value "" -objects $obj
set_property -name "options.more_options" -value "" -objects $obj

}
# Create 'impl_1_place_report_io_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_io_0] "" ] } {
  create_report_config -report_name impl_1_place_report_io_0 -report_type report_io:1.0 -steps place_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_io_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "1" -objects $obj
set_property -name "options.more_options" -value "" -objects $obj

}
# Create 'impl_1_place_report_utilization_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_utilization_0] "" ] } {
  create_report_config -report_name impl_1_place_report_utilization_0 -report_type report_utilization:1.0 -steps place_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_utilization_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "1" -objects $obj
set_property -name "options.pblocks" -value "" -objects $obj
set_property -name "options.cells" -value "" -objects $obj
set_property -name "options.slr" -value "0" -objects $obj
set_property -name "options.packthru" -value "0" -objects $obj
set_property -name "options.hierarchical" -value "0" -objects $obj
set_property -name "options.hierarchical_depth" -value "" -objects $obj
set_property -name "options.hierarchical_percentages" -value "0" -objects $obj
set_property -name "options.more_options" -value "" -objects $obj

}
# Create 'impl_1_place_report_control_sets_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_control_sets_0] "" ] } {
  create_report_config -report_name impl_1_place_report_control_sets_0 -report_type report_control_sets:1.0 -steps place_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_control_sets_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "1" -objects $obj
set_property -name "options.verbose" -value "1" -objects $obj
set_property -name "options.cells" -value "" -objects $obj
set_property -name "options.more_options" -value "" -objects $obj

}
# Create 'impl_1_place_report_incremental_reuse_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_incremental_reuse_0] "" ] } {
  create_report_config -report_name impl_1_place_report_incremental_reuse_0 -report_type report_incremental_reuse:1.0 -steps place_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_incremental_reuse_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.cells" -value "" -objects $obj
set_property -name "options.hierarchical" -value "0" -objects $obj
set_property -name "options.hierarchical_depth" -value "" -objects $obj
set_property -name "options.more_options" -value "" -objects $obj

}
# Create 'impl_1_place_report_incremental_reuse_1' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_incremental_reuse_1] "" ] } {
  create_report_config -report_name impl_1_place_report_incremental_reuse_1 -report_type report_incremental_reuse:1.0 -steps place_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_incremental_reuse_1]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.cells" -value "" -objects $obj
set_property -name "options.hierarchical" -value "0" -objects $obj
set_property -name "options.hierarchical_depth" -value "" -objects $obj
set_property -name "options.more_options" -value "" -objects $obj

}
# Create 'impl_1_place_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_place_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps place_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.check_timing_verbose" -value "0" -objects $obj
set_property -name "options.delay_type" -value "" -objects $obj
set_property -name "options.setup" -value "0" -objects $obj
set_property -name "options.hold" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj
set_property -name "options.nworst" -value "" -objects $obj
set_property -name "options.unique_pins" -value "0" -objects $obj
set_property -name "options.path_type" -value "" -objects $obj
set_property -name "options.slack_lesser_than" -value "" -objects $obj
set_property -name "options.report_unconstrained" -value "0" -objects $obj
set_property -name "options.warn_on_violation" -value "0" -objects $obj
set_property -name "options.significant_digits" -value "" -objects $obj
set_property -name "options.cell" -value "" -objects $obj
set_property -name "options.more_options" -value "" -objects $obj

}
# Create 'impl_1_post_place_power_opt_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_post_place_power_opt_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_post_place_power_opt_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps post_place_power_opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_post_place_power_opt_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.check_timing_verbose" -value "0" -objects $obj
set_property -name "options.delay_type" -value "" -objects $obj
set_property -name "options.setup" -value "0" -objects $obj
set_property -name "options.hold" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj
set_property -name "options.nworst" -value "" -objects $obj
set_property -name "options.unique_pins" -value "0" -objects $obj
set_property -name "options.path_type" -value "" -objects $obj
set_property -name "options.slack_lesser_than" -value "" -objects $obj
set_property -name "options.report_unconstrained" -value "0" -objects $obj
set_property -name "options.warn_on_violation" -value "0" -objects $obj
set_property -name "options.significant_digits" -value "" -objects $obj
set_property -name "options.cell" -value "" -objects $obj
set_property -name "options.more_options" -value "" -objects $obj

}
# Create 'impl_1_phys_opt_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_phys_opt_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_phys_opt_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps phys_opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_phys_opt_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.check_timing_verbose" -value "0" -objects $obj
set_property -name "options.delay_type" -value "" -objects $obj
set_property -name "options.setup" -value "0" -objects $obj
set_property -name "options.hold" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj
set_property -name "options.nworst" -value "" -objects $obj
set_property -name "options.unique_pins" -value "0" -objects $obj
set_property -name "options.path_type" -value "" -objects $obj
set_property -name "options.slack_lesser_than" -value "" -objects $obj
set_property -name "options.report_unconstrained" -value "0" -objects $obj
set_property -name "options.warn_on_violation" -value "0" -objects $obj
set_property -name "options.significant_digits" -value "" -objects $obj
set_property -name "options.cell" -value "" -objects $obj
set_property -name "options.more_options" -value "" -objects $obj

}
# Create 'impl_1_route_report_drc_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_drc_0] "" ] } {
  create_report_config -report_name impl_1_route_report_drc_0 -report_type report_drc:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_drc_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "1" -objects $obj
set_property -name "options.upgrade_cw" -value "0" -objects $obj
set_property -name "options.checks" -value "" -objects $obj
set_property -name "options.ruledecks" -value "" -objects $obj
set_property -name "options.more_options" -value "" -objects $obj

}
# Create 'impl_1_route_report_methodology_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_methodology_0] "" ] } {
  create_report_config -report_name impl_1_route_report_methodology_0 -report_type report_methodology:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_methodology_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "1" -objects $obj
set_property -name "options.checks" -value "" -objects $obj
set_property -name "options.more_options" -value "" -objects $obj

}
# Create 'impl_1_route_report_power_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_power_0] "" ] } {
  create_report_config -report_name impl_1_route_report_power_0 -report_type report_power:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_power_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "1" -objects $obj
set_property -name "options.advisory" -value "0" -objects $obj
set_property -name "options.xpe" -value "" -objects $obj
set_property -name "options.more_options" -value "" -objects $obj

}
# Create 'impl_1_route_report_route_status_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_route_status_0] "" ] } {
  create_report_config -report_name impl_1_route_report_route_status_0 -report_type report_route_status:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_route_status_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "1" -objects $obj
set_property -name "options.of_objects" -value "" -objects $obj
set_property -name "options.route_type" -value "" -objects $obj
set_property -name "options.list_all_nets" -value "0" -objects $obj
set_property -name "options.show_all" -value "0" -objects $obj
set_property -name "options.has_routing" -value "0" -objects $obj
set_property -name "options.more_options" -value "" -objects $obj

}
# Create 'impl_1_route_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_route_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "1" -objects $obj
set_property -name "options.check_timing_verbose" -value "0" -objects $obj
set_property -name "options.delay_type" -value "" -objects $obj
set_property -name "options.setup" -value "0" -objects $obj
set_property -name "options.hold" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj
set_property -name "options.nworst" -value "" -objects $obj
set_property -name "options.unique_pins" -value "0" -objects $obj
set_property -name "options.path_type" -value "" -objects $obj
set_property -name "options.slack_lesser_than" -value "" -objects $obj
set_property -name "options.report_unconstrained" -value "0" -objects $obj
set_property -name "options.warn_on_violation" -value "0" -objects $obj
set_property -name "options.significant_digits" -value "" -objects $obj
set_property -name "options.cell" -value "" -objects $obj
set_property -name "options.more_options" -value "" -objects $obj

}
# Create 'impl_1_route_report_incremental_reuse_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_incremental_reuse_0] "" ] } {
  create_report_config -report_name impl_1_route_report_incremental_reuse_0 -report_type report_incremental_reuse:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_incremental_reuse_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "1" -objects $obj
set_property -name "options.cells" -value "" -objects $obj
set_property -name "options.hierarchical" -value "0" -objects $obj
set_property -name "options.hierarchical_depth" -value "" -objects $obj
set_property -name "options.more_options" -value "" -objects $obj

}
# Create 'impl_1_route_report_clock_utilization_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_clock_utilization_0] "" ] } {
  create_report_config -report_name impl_1_route_report_clock_utilization_0 -report_type report_clock_utilization:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_clock_utilization_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "1" -objects $obj
set_property -name "options.write_xdc" -value "0" -objects $obj
set_property -name "options.clock_roots_only" -value "0" -objects $obj
set_property -name "options.more_options" -value "" -objects $obj

}
# Create 'impl_1_post_route_phys_opt_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_post_route_phys_opt_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_post_route_phys_opt_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps post_route_phys_opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_post_route_phys_opt_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "1" -objects $obj
set_property -name "options.check_timing_verbose" -value "0" -objects $obj
set_property -name "options.delay_type" -value "" -objects $obj
set_property -name "options.setup" -value "0" -objects $obj
set_property -name "options.hold" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj
set_property -name "options.nworst" -value "" -objects $obj
set_property -name "options.unique_pins" -value "0" -objects $obj
set_property -name "options.path_type" -value "" -objects $obj
set_property -name "options.slack_lesser_than" -value "" -objects $obj
set_property -name "options.report_unconstrained" -value "0" -objects $obj
set_property -name "options.warn_on_violation" -value "1" -objects $obj
set_property -name "options.significant_digits" -value "" -objects $obj
set_property -name "options.cell" -value "" -objects $obj
set_property -name "options.more_options" -value "" -objects $obj

}
set obj [get_runs impl_1]
set_property -name "constrset" -value "constrs_1" -objects $obj
set_property -name "description" -value "Default settings for Implementation." -objects $obj
set_property -name "flow" -value "Vivado Implementation 2018" -objects $obj
set_property -name "name" -value "impl_1" -objects $obj
set_property -name "needs_refresh" -value "0" -objects $obj
set_property -name "pr_configuration" -value "" -objects $obj
set_property -name "srcset" -value "sources_1" -objects $obj
# set_property -name "incremental_checkpoint" -value "" -objects $obj
set_property -name "include_in_archive" -value "1" -objects $obj
set_property -name "strategy" -value "Vivado Implementation Defaults" -objects $obj
set_property -name "steps.opt_design.is_enabled" -value "1" -objects $obj
set_property -name "steps.opt_design.tcl.pre" -value "" -objects $obj
set_property -name "steps.opt_design.tcl.post" -value "" -objects $obj
set_property -name "steps.opt_design.args.verbose" -value "0" -objects $obj
set_property -name "steps.opt_design.args.directive" -value "Default" -objects $obj
set_property -name "steps.opt_design.args.more options" -value "" -objects $obj
set_property -name "steps.power_opt_design.is_enabled" -value "0" -objects $obj
set_property -name "steps.power_opt_design.tcl.pre" -value "" -objects $obj
set_property -name "steps.power_opt_design.tcl.post" -value "" -objects $obj
set_property -name "steps.power_opt_design.args.more options" -value "" -objects $obj
set_property -name "steps.place_design.tcl.pre" -value "" -objects $obj
set_property -name "steps.place_design.tcl.post" -value "" -objects $obj
set_property -name "steps.place_design.args.directive" -value "Default" -objects $obj
set_property -name "steps.place_design.args.more options" -value "" -objects $obj
set_property -name "steps.post_place_power_opt_design.is_enabled" -value "0" -objects $obj
set_property -name "steps.post_place_power_opt_design.tcl.pre" -value "" -objects $obj
set_property -name "steps.post_place_power_opt_design.tcl.post" -value "" -objects $obj
set_property -name "steps.post_place_power_opt_design.args.more options" -value "" -objects $obj
set_property -name "steps.phys_opt_design.is_enabled" -value "0" -objects $obj
set_property -name "steps.phys_opt_design.tcl.pre" -value "" -objects $obj
set_property -name "steps.phys_opt_design.tcl.post" -value "" -objects $obj
set_property -name "steps.phys_opt_design.args.directive" -value "Default" -objects $obj
set_property -name "steps.phys_opt_design.args.more options" -value "" -objects $obj
set_property -name "steps.route_design.tcl.pre" -value "" -objects $obj
set_property -name "steps.route_design.tcl.post" -value "" -objects $obj
set_property -name "steps.route_design.args.directive" -value "Default" -objects $obj
set_property -name "steps.route_design.args.more options" -value "" -objects $obj
set_property -name "steps.post_route_phys_opt_design.is_enabled" -value "0" -objects $obj
set_property -name "steps.post_route_phys_opt_design.tcl.pre" -value "" -objects $obj
set_property -name "steps.post_route_phys_opt_design.tcl.post" -value "" -objects $obj
set_property -name "steps.post_route_phys_opt_design.args.directive" -value "Default" -objects $obj
set_property -name "steps.post_route_phys_opt_design.args.more options" -value "" -objects $obj
set_property -name "steps.write_bitstream.tcl.pre" -value "" -objects $obj
set_property -name "steps.write_bitstream.tcl.post" -value "" -objects $obj
set_property -name "steps.write_bitstream.args.raw_bitfile" -value "0" -objects $obj
set_property -name "steps.write_bitstream.args.mask_file" -value "0" -objects $obj
set_property -name "steps.write_bitstream.args.no_binary_bitfile" -value "0" -objects $obj
set_property -name "steps.write_bitstream.args.bin_file" -value "0" -objects $obj
set_property -name "steps.write_bitstream.args.readback_file" -value "0" -objects $obj
set_property -name "steps.write_bitstream.args.logic_location_file" -value "0" -objects $obj
set_property -name "steps.write_bitstream.args.verbose" -value "0" -objects $obj
set_property -name "steps.write_bitstream.args.more options" -value "" -objects $obj

# set the current impl run
current_run -implementation [get_runs impl_1]

puts "INFO: Project created:$project_name"