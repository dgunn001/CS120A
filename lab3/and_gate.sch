<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="i1" />
        <signal name="i2" />
        <signal name="d" />
        <port polarity="Input" name="i1" />
        <port polarity="Input" name="i2" />
        <port polarity="Output" name="d" />
        <blockdef name="and2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
        </blockdef>
        <block symbolname="and2" name="XLXI_3">
            <blockpin signalname="i1" name="I0" />
            <blockpin signalname="i2" name="I1" />
            <blockpin signalname="d" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1584" y="1136" name="XLXI_3" orien="M180" />
        <branch name="i1">
            <wire x2="1584" y1="1200" y2="1200" x1="1552" />
        </branch>
        <iomarker fontsize="28" x="1552" y="1200" name="i1" orien="R180" />
        <branch name="i2">
            <wire x2="1584" y1="1264" y2="1264" x1="1552" />
        </branch>
        <iomarker fontsize="28" x="1552" y="1264" name="i2" orien="R180" />
        <branch name="d">
            <wire x2="1872" y1="1232" y2="1232" x1="1840" />
        </branch>
        <iomarker fontsize="28" x="1872" y="1232" name="d" orien="R0" />
    </sheet>
</drawing>