############################################################
# SDC Constraints for 8x8 Dadda Multiplier
############################################################

# Define the design name
define_design_lib WORK -path ./WORK

# Create the main clock (assume 100 MHz)
create_clock -name clk -period 10.0 [get_ports clk]

# Input and output delays (assume typical 10% of clock period)
set_input_delay  1.0 -clock clk [remove_from_collection [all_inputs] [get_ports clk]]
set_output_delay 1.0 -clock clk [all_outputs]

# Input drive strength (optional, to model driving source)
set_drive 2 [all_inputs]

# Load on outputs (optional, to model connected logic)
set_load 0.05 [all_outputs]

# Specify operating conditions
set_operating_conditions -analysis_type bc_wc

# Wire load model (if not physical aware synthesis)
set_wire_load_model -name typical -library typical

# Prevent Genus from optimizing away hierarchy
set_dont_touch [get_cells dadda8x8]

# Report final timing
report_timing
