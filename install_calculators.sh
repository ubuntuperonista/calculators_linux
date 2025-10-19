## Install HP-15c emulator on Linux as per instucted 
## on https://ubuntuperonista.blogspot.com/2021/12/como-instalo-emulador-calculadora-hp-ubuntu.html
mkdir /tmp/hp15c/ ;
cd /tmp/hp15c/ ;
wget  https://bit.ly/3cMWTH8 -O HP-15C_4.3.00_Linux_x86_64.zip ;
unzip HP-15C_4.3.00_Linux_x86_64.zip ;
chmod +x /tmp/hp15c/HP-15C ;
cp /tmp/hp15c/HP-15C_Simulator_Font.ttf ~/.local/share/fonts/ ;
fc-cache -f ;
cd /tmp ;
mv /tmp/hp15c/ ~/.hp15c/ ;
cd ~/.hp15c/doc ;
wget http://h10032.www1.hp.com/ctg/Manual/c00503576.pdf -O hp11c_owners_manual_and_problem_solving_guide.pdf ;
wget http://h10032.www1.hp.com/ctg/Manual/c03030589.pdf -O hp15c_deluxe_owners_handbook.pdf ;
cd ~

## Install the free42 HP-42 clone emulator from Ubuntu/Debian repos:
sudo apt update
sudo apt upgrade
sudo apt install free42-nologo

## Install the Thomas Okken's Plus42 HP-42 emulator on Linux
cd /tmp/ ;
wget https://thomasokken.com/plus42/download/Plus42Linux.tgz ;
tar xvfz Plus42Linux.tgz
mv /tmp/Plus42Linux/ ~/.plus42/
mkdir $HOME/.local/share/plus42 ;
cd $HOME/.local/share/plus42 ;
wget https://thomasokken.com/plus42/skins/desktop/Mueck_P42d.zip ;
wget https://thomasokken.com/plus42/skins/desktop/Mueck_P42d.gif ;
wget https://thomasokken.com/plus42/skins/desktop/Mueck_P42d.layout ;
wget https://thomasokken.com/plus42/skins/desktop/Mueck_P42d_MN.zip ;
wget https://thomasokken.com/plus42/skins/desktop/Mueck_P42d_MN.gif ;
wget https://thomasokken.com/plus42/skins/desktop/Mueck_P42d_MN.layout ;
unzip -fo Mueck_P42d.zip  ;
unzip -fo Mueck_P42d_MN.zip

## Install calculator programs for yours Thomas Okken's Plus42 calculator emulator:
mkdir ~/.plus42/prg/
cd  ~/.plus42/prg
wget https://thomasokken.com/free42/42progs/plot_orig.raw
wget https://thomasokken.com/free42/42progs/plot_solve.raw
wget https://thomasokken.com/free42/42progs/dplot_orig.raw
wget https://thomasokken.com/free42/42progs/dplot_solve.raw
wget https://thomasokken.com/free42/42progs/sun.raw
wget https://thomasokken.com/free42/42progs/prm_dec.raw
wget https://thomasokken.com/free42/42progs/prm_bin.raw
wget https://thomasokken.com/free42/42progs/stress.raw
wget https://thomasokken.com/free42/42progs/synth.raw
wget https://thomasokken.com/free42/42progs/mast.raw
wget https://thomasokken.com/free42/42progs/minehunt.raw
wget https://thomasokken.com/free42/42progs/OkieDokie/okiedokie.raw
wget https://thomasokken.com/free42/42progs/rtmin.raw
wget https://thomasokken.com/free42/42progs/RootsEqns.raw
wget https://thomasokken.com/free42/42progs/mlran.raw
wget https://thomasokken.com/free42/42progs/aes.raw
wget https://thomasokken.com/free42/42progs/aesprep.raw
wget https://thomasokken.com/free42/42progs/Base.raw
wget https://thomasokken.com/free42/42progs/Convert.raw
wget https://thomasokken.com/free42/42progs/Finance.raw
wget https://thomasokken.com/free42/42progs/Triangle.raw
wget https://thomasokken.com/free42/42progs/ses.raw
wget https://thomasokken.com/free42/42progs/G4_G3_G2.raw
wget https://thomasokken.com/free42/42progs/STATISTICS.raw
wget https://thomasokken.com/free42/42progs/ntrp.raw
wget https://thomasokken.com/free42/42progs/lrnc.raw
wget https://thomasokken.com/free42/42progs/mort.raw
wget https://thomasokken.com/free42/42progs/Moody42/Moody42.raw
wget https://thomasokken.com/free42/42progs/Astronavigatie/astro_tso.raw
wget https://thomasokken.com/free42/42progs/Astronavigatie/astra_tso.raw
wget https://thomasokken.com/free42/42progs/Astronavigatie/avsho.raw
wget https://thomasokken.com/free42/42progs/unixtime.raw
wget https://thomasokken.com/free42/42progs/moeglein/DO_CALC.raw
wget https://thomasokken.com/free42/42progs/moeglein/N_CAL.raw
wget https://thomasokken.com/free42/42progs/Twix/twix.raw
wget https://thomasokken.com/free42/42progs/cp2oct.raw
wget https://thomasokken.com/free42/42progs/Convert2.raw

## Install x48ng HP-48 clone emulator on Ubuntu Linux:
### First install dependencies:
sudo apt install git curl libpkgconf3 libreadline-dev libsdl2-dev libx11-dev libxext-dev liblua5.4-dev

### Then clone the source code and compile it in Ubuntu:
cd /tmp
git clone https://github.com/gwenhael-le-moine/x48ng
cd /tmp/x48ng
make
sudo make install PREFIX=/usr
/usr/share/x48ng/setup-x48ng-home.sh

### Then adapt the config files for the HP-48SX and HP-48GX
x48ng --print-config > ~/.config/x48ng/config.lua.bak
x48ng --print-config > ~/.config/x48ng/config.lua
cat << EOF > ~/.config/x48ng/config_gx.lua
--------------------------------------------------------------------------------
-- Configuration file for x48ng with hp48gx rom
-- This is a comment
-- `config_dir` is relative to $XDG_CONFIG_HOME/, or $HOME/.config/ or absolute
config_dir = "x48ng"

-- Pathes are either relative to `config_dir` or absolute
rom = "gxrom-r"
ram = "ram_gx"
state = "state_gx"
port1 = "port1_gx"
port2 = "port2_gx"

pseudo_terminal = false
serial = false
serial_line = "/dev/ttyS0"

verbose = false
debugger = false
throttle = false

--------------------
-- User Interface --
--------------------
frontend = "sdl2" -- possible values: "x11", "sdl2" "tui", "tui-small", "tui-tiny"
hide_chrome = false
fullscreen = false
scale = 1.333000 -- applies only to sdl2
mono = false
gray = false
leave_shift_keys = false
inhibit_shutdown = false

x11_visual = "default"
netbook = false
font_small = "-*-fixed-bold-r-normal-*-14-*-*-*-*-*-iso8859-1"
font_medium = "-*-fixed-bold-r-normal-*-15-*-*-*-*-*-iso8859-1"
font_large = "-*-fixed-medium-r-normal-*-20-*-*-*-*-*-iso8859-1"
font_devices = "-*-fixed-medium-r-normal-*-12-*-*-*-*-*-iso8859-1"
--------------------------------------------------------------------------------
EOF

cat << EOF > ~/.config/x48ng/config_sx.lua
--------------------------------------------------------------------------------
-- Configuration file for x48ng
-- This is a comment
-- `config_dir` is relative to $XDG_CONFIG_HOME/, or $HOME/.config/ or absolute
config_dir = "x48ng"lse
serial = false
-- Pathes are either relative to `config_dir` or absolute
rom = "sxrom-j"
ram = "ram_sx"e
state = "state_sx"
port1 = "port1_sx"
port2 = "port2_sx"
--------------------
pseudo_terminal = false
serial = false------
serial_line = "/dev/ttyS0"ble values: "x11", "sdl2" "tui", "tui-small", "tui-tin
--------------------------------------------------------------------------------
verbose = false
debugger = false
throttle = false

--------------------
-- User Interface --
--------------------
frontend = "sdl2" -- possible values: "x11", "sdl2" "tui", "tui-small", "tui-tiny"
hide_chrome = false
fullscreen = false
scale = 1.333000 -- applies only to sdl2
mono = false
gray = false
leave_shift_keys = false
inhibit_shutdown = false

x11_visual = "default"
netbook = false
font_small = "-*-fixed-bold-r-normal-*-14-*-*-*-*-*-iso8859-1"
font_medium = "-*-fixed-bold-r-normal-*-15-*-*-*-*-*-iso8859-1"
font_large = "-*-fixed-medium-r-normal-*-20-*-*-*-*-*-iso8859-1"
font_devices = "-*-fixed-medium-r-normal-*-12-*-*-*-*-*-iso8859-1"
--------------------------------------------------------------------------------
EOF

## create x48ng executable for HP-48gx:
cat << EOF > ~/.config/x48ng/hp48g.sh
#!/bin/sh
cd /home/$USER/.config/x48ng/
rm ram_gx
rm state_gx
rm port1_gx
rm port2_gx
x48ng --sdl2 --scale 1.333 --config /home/$USER/.config/x48ng/config_gx.lua
EOF

## create x48ng executable for HP-48sx:
cat << EOF > ~/.config/x48ng/hp48sx.sh
#!/bin/sh
cd /home/$USER/.config/x48ng/
rm ram_sx
rm state_sx
rm port1_sx
rm port2_sx
x48ng --sdl2 --scale 1.333 -c /home/$USER/.config/x48ng/config_sx.lua 
EOF



## Install the WP-43 calculator WP43S emulator on Linux
### First install its dependencies from the Ubuntu repos:
sudo apt-get install meson git ninja-build pkg-config build-essential ccache libgtk-3-dev libgmp-dev libpulse-dev gcc-arm-none-eabi

### Then clone its source code, compile it, and create a launcher on Ubuntu
cd /tmp ;
git clone https://gitlab.com/rpncalculators/wp43
cd /tmp/wp43/ ;
make clean ;
make ;
cd /tmp ;
mv wp43/ ~/.wp43/
echo "cd ~/.wp43/build.sim/src/wp43-gtk/" > ~/.wp43.sh
echo "./wp43" >> ~/.wp43.sh 
chmod +x ~/.wp43.sh
