v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -130 10 -40 10 {lab=vgs}
N -130 10 -130 30 {lab=vgs}
N -130 90 -130 110 {lab=0}
N -0 40 0 90 {lab=0}
N 0 -40 0 -20 {lab=vds}
N 0 -40 140 -40 {lab=vds}
N 140 -40 140 -0 {lab=vds}
N 140 60 140 90 {lab=0}
N 140 -80 170 -80 {lab=vds}
N 140 -80 140 -40 {lab=vds}
N -0 10 40 10 {lab=0}
N 40 10 40 60 {lab=0}
N 0 60 40 60 {lab=0}
N -150 -30 -130 -30 {lab=vgs}
N -130 -30 -130 10 {lab=vgs}
C {sky130_fd_pr/pfet_01v8.sym} -20 10 2 1 {name=M1
W=2
L=1
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {vsource.sym} -130 60 0 0 {name=V1 value=-1.8 savecurrent=false}
C {ipin.sym} -150 -30 0 0 {name=p1 lab=vgs}
C {gnd.sym} 0 90 0 0 {name=l1 lab=0}
C {code.sym} 260 10 0 0 {name=s1 only_toplevel=false value="
.lib /foss/pdks/ciel/sky130/versions/7b70722e33c03fcb5dabcf4d479fb0822d9251c9/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.control
  save all
  save @m.xm1.msky130_fd_pr__pfet_01v8[id]
  save @m.xm1.msky130_fd_pr__pfet_01v8[gm]
  
  op
  
  * --- Output Characteristics (Id-Vds) ---
  dc v2 0 -1.8 -0.1 v1 0 -1.8 -0.2 
  * Negating the current to force the standard negative plot
  plot -@m.xm1.msky130_fd_pr__pfet_01v8[id] 
  plot @m.xm1.msky130_fd_pr__pfet_01v8[gm] 
  
  * --- Transfer Characteristics (Id-Vgs) ---
  dc v1 0 -1.8 -0.1 
  * Negating the current here as well
  plot -@m.xm1.msky130_fd_pr__pfet_01v8[id] 
  plot @m.xm1.msky130_fd_pr__pfet_01v8[gm] 

  print @m.xm1.msky130_fd_pr__pfet_01v8[id]
  print @m.xm1.msky130_fd_pr__pfet_01v8[gm]
  print @m.xm1.msky130_fd_pr__pfet_01v8[vth]
  print @m.xm1.msky130_fd_pr__pfet_01v8[vgs]
  print @m.xm1.msky130_fd_pr__pfet_01v8[vdsat]
  print @m.xm1.msky130_fd_pr__pfet_01v8[vds]  
  print @m.xm1.msky130_fd_pr__pfet_01v8[gds]
   
  write pmosvi.raw
.endc
"}
C {gnd.sym} -130 110 0 0 {name=l2 lab=0}
C {vsource.sym} 140 30 0 0 {name=V2 value=-1.8 savecurrent=false}
C {gnd.sym} 140 90 0 0 {name=l3 lab=0}
C {ipin.sym} 170 -80 2 0 {name=p2 lab=vds}
