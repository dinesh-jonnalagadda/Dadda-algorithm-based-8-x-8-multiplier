# ==============================================================
# 
# ==============================================================
set_db init_lib_search_path /home/iiitdmk/Desktop
# === Library Search Paths ===
set_db init_lib_search_path /home/install/FOUNDRY/digital/90nm/dig/lib/

# Specify your standard cell library
# Replace "slow.lib" if your library file has a different name
set_db library slow.lib

# === Read RTL Source ===
read_hdl {/home/iiitdmk/Desktop/8x8multiplier/dadda8x8.v}

# === Elaborate the Top Design ===
elaborate 

# === Apply Timing Constraints ===
read_sdc /home/iiitdmk/Desktop/8x8multiplier/constraints_input.sdc

# === Set Synthesis Effort Levels ===
set_db syn_generic_effort medium
set_db syn_map_effort     medium
set_db syn_opt_effort     medium

# === Perform Synthesis ===
syn_generic
syn_map
syn_opt

report_area > reports/area_report.rpt
report_timing > reports/timing_report.rpt
report_power > reports/power_report.rpt

write_hdl > outputs/dadda8x8_netlist.v
write_sdf > outputs/dadda8x8.sdf
write_sdc > outputs/dadda8x8_postsyn.sdc
write_db outputs/dadda8x8_genus.db

# === Open GUI for Schematic View ===
gui_show

# === End of Script ===
