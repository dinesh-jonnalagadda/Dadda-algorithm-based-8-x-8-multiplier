# ####################################################################

#  Created by Genus(TM) Synthesis Solution 20.11-s111_1 on Sun Nov 02 10:17:27 IST 2025

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design dadda8x8

set_load -pin_load 0.05 [get_ports {P[15]}]
set_load -pin_load 0.05 [get_ports {P[14]}]
set_load -pin_load 0.05 [get_ports {P[13]}]
set_load -pin_load 0.05 [get_ports {P[12]}]
set_load -pin_load 0.05 [get_ports {P[11]}]
set_load -pin_load 0.05 [get_ports {P[10]}]
set_load -pin_load 0.05 [get_ports {P[9]}]
set_load -pin_load 0.05 [get_ports {P[8]}]
set_load -pin_load 0.05 [get_ports {P[7]}]
set_load -pin_load 0.05 [get_ports {P[6]}]
set_load -pin_load 0.05 [get_ports {P[5]}]
set_load -pin_load 0.05 [get_ports {P[4]}]
set_load -pin_load 0.05 [get_ports {P[3]}]
set_load -pin_load 0.05 [get_ports {P[2]}]
set_load -pin_load 0.05 [get_ports {P[1]}]
set_load -pin_load 0.05 [get_ports {P[0]}]
set_clock_gating_check -setup 0.0 
set_drive 2.0 [get_ports {A[7]}]
set_drive 2.0 [get_ports {A[6]}]
set_drive 2.0 [get_ports {A[5]}]
set_drive 2.0 [get_ports {A[4]}]
set_drive 2.0 [get_ports {A[3]}]
set_drive 2.0 [get_ports {A[2]}]
set_drive 2.0 [get_ports {A[1]}]
set_drive 2.0 [get_ports {A[0]}]
set_drive 2.0 [get_ports {B[7]}]
set_drive 2.0 [get_ports {B[6]}]
set_drive 2.0 [get_ports {B[5]}]
set_drive 2.0 [get_ports {B[4]}]
set_drive 2.0 [get_ports {B[3]}]
set_drive 2.0 [get_ports {B[2]}]
set_drive 2.0 [get_ports {B[1]}]
set_drive 2.0 [get_ports {B[0]}]
set_wire_load_mode "enclosed"
