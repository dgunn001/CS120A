<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="kintex7l" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="A" />
        <signal name="C" />
        <signal name="XLXN_10" />
        <signal name="XLXN_12" />
        <signal name="B" />
        <signal name="XLXN_21" />
        <signal name="Enable" />
        <signal name="D0" />
        <signal name="D1" />
        <signal name="D2" />
        <signal name="D3" />
        <signal name="D4" />
        <signal name="D5" />
        <signal name="D6" />
        <signal name="D7" />
        <port polarity="Input" name="A" />
        <port polarity="Input" name="C" />
        <port polarity="Input" name="B" />
        <port polarity="Input" name="Enable" />
        <port polarity="Output" name="D0" />
        <port polarity="Output" name="D1" />
        <port polarity="Output" name="D2" />
        <port polarity="Output" name="D3" />
        <port polarity="Output" name="D4" />
        <port polarity="Output" name="D5" />
        <port polarity="Output" name="D6" />
        <port polarity="Output" name="D7" />
        <blockdef name="and4">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-112" y2="-112" x1="144" />
            <arc ex="144" ey="-208" sx="144" sy="-112" r="48" cx="144" cy="-160" />
            <line x2="144" y1="-208" y2="-208" x1="64" />
            <line x2="64" y1="-64" y2="-256" x1="64" />
            <line x2="192" y1="-160" y2="-160" x1="256" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-64" y2="-64" x1="0" />
        </blockdef>
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <block symbolname="and4" name="XLXI_1">
            <blockpin signalname="Enable" name="I0" />
            <blockpin signalname="C" name="I1" />
            <blockpin signalname="XLXN_21" name="I2" />
            <blockpin signalname="XLXN_12" name="I3" />
            <blockpin signalname="D1" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_2">
            <blockpin signalname="Enable" name="I0" />
            <blockpin signalname="XLXN_10" name="I1" />
            <blockpin signalname="B" name="I2" />
            <blockpin signalname="XLXN_12" name="I3" />
            <blockpin signalname="D2" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_3">
            <blockpin signalname="Enable" name="I0" />
            <blockpin signalname="C" name="I1" />
            <blockpin signalname="B" name="I2" />
            <blockpin signalname="XLXN_12" name="I3" />
            <blockpin signalname="D3" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_4">
            <blockpin signalname="Enable" name="I0" />
            <blockpin signalname="XLXN_10" name="I1" />
            <blockpin signalname="XLXN_21" name="I2" />
            <blockpin signalname="A" name="I3" />
            <blockpin signalname="D4" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_5">
            <blockpin signalname="Enable" name="I0" />
            <blockpin signalname="C" name="I1" />
            <blockpin signalname="XLXN_21" name="I2" />
            <blockpin signalname="A" name="I3" />
            <blockpin signalname="D5" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_6">
            <blockpin signalname="Enable" name="I0" />
            <blockpin signalname="XLXN_10" name="I1" />
            <blockpin signalname="B" name="I2" />
            <blockpin signalname="A" name="I3" />
            <blockpin signalname="D6" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_7">
            <blockpin signalname="Enable" name="I0" />
            <blockpin signalname="C" name="I1" />
            <blockpin signalname="B" name="I2" />
            <blockpin signalname="A" name="I3" />
            <blockpin signalname="D7" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_8">
            <blockpin signalname="Enable" name="I0" />
            <blockpin signalname="XLXN_10" name="I1" />
            <blockpin signalname="XLXN_21" name="I2" />
            <blockpin signalname="XLXN_12" name="I3" />
            <blockpin signalname="D0" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_9">
            <blockpin signalname="C" name="I" />
            <blockpin signalname="XLXN_10" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_11">
            <blockpin signalname="A" name="I" />
            <blockpin signalname="XLXN_12" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_15">
            <blockpin signalname="B" name="I" />
            <blockpin signalname="XLXN_21" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="A">
            <wire x2="800" y1="224" y2="240" x1="800" />
            <wire x2="864" y1="240" y2="240" x1="800" />
            <wire x2="800" y1="240" y2="1712" x1="800" />
            <wire x2="2736" y1="1712" y2="1712" x1="800" />
            <wire x2="800" y1="1712" y2="1952" x1="800" />
            <wire x2="2736" y1="1952" y2="1952" x1="800" />
            <wire x2="800" y1="1952" y2="2192" x1="800" />
            <wire x2="2736" y1="2192" y2="2192" x1="800" />
            <wire x2="800" y1="2192" y2="2432" x1="800" />
            <wire x2="800" y1="2432" y2="2656" x1="800" />
            <wire x2="800" y1="2656" y2="2672" x1="800" />
            <wire x2="2736" y1="2432" y2="2432" x1="800" />
            <wire x2="864" y1="176" y2="240" x1="864" />
            <wire x2="912" y1="176" y2="176" x1="864" />
            <wire x2="912" y1="176" y2="240" x1="912" />
        </branch>
        <iomarker fontsize="28" x="800" y="224" name="A" orien="R270" />
        <branch name="C">
            <wire x2="1392" y1="240" y2="256" x1="1392" />
            <wire x2="1472" y1="256" y2="256" x1="1392" />
            <wire x2="1392" y1="256" y2="1120" x1="1392" />
            <wire x2="2736" y1="1120" y2="1120" x1="1392" />
            <wire x2="1392" y1="1120" y2="1584" x1="1392" />
            <wire x2="2736" y1="1584" y2="1584" x1="1392" />
            <wire x2="1392" y1="1584" y2="2080" x1="1392" />
            <wire x2="2736" y1="2080" y2="2080" x1="1392" />
            <wire x2="1392" y1="2080" y2="2560" x1="1392" />
            <wire x2="1392" y1="2560" y2="2608" x1="1392" />
            <wire x2="1392" y1="2608" y2="2704" x1="1392" />
            <wire x2="2736" y1="2560" y2="2560" x1="1392" />
            <wire x2="1472" y1="192" y2="256" x1="1472" />
            <wire x2="1520" y1="192" y2="192" x1="1472" />
            <wire x2="1520" y1="192" y2="256" x1="1520" />
        </branch>
        <iomarker fontsize="28" x="1392" y="240" name="C" orien="R270" />
        <instance x="2736" y="1008" name="XLXI_8" orien="R0" />
        <instance x="2736" y="1248" name="XLXI_1" orien="R0" />
        <instance x="2736" y="1472" name="XLXI_2" orien="R0" />
        <instance x="2736" y="1712" name="XLXI_3" orien="R0" />
        <instance x="2736" y="1968" name="XLXI_4" orien="R0" />
        <instance x="2736" y="2208" name="XLXI_5" orien="R0" />
        <instance x="2736" y="2448" name="XLXI_6" orien="R0" />
        <instance x="2736" y="2688" name="XLXI_7" orien="R0" />
        <iomarker fontsize="28" x="368" y="240" name="Enable" orien="R270" />
        <instance x="880" y="240" name="XLXI_11" orien="R90" />
        <instance x="1488" y="256" name="XLXI_9" orien="R90" />
        <branch name="XLXN_10">
            <wire x2="1520" y1="480" y2="880" x1="1520" />
            <wire x2="2736" y1="880" y2="880" x1="1520" />
            <wire x2="1520" y1="880" y2="1344" x1="1520" />
            <wire x2="2736" y1="1344" y2="1344" x1="1520" />
            <wire x2="1520" y1="1344" y2="1840" x1="1520" />
            <wire x2="2736" y1="1840" y2="1840" x1="1520" />
            <wire x2="1520" y1="1840" y2="2320" x1="1520" />
            <wire x2="1520" y1="2320" y2="2704" x1="1520" />
            <wire x2="2736" y1="2320" y2="2320" x1="1520" />
        </branch>
        <branch name="XLXN_12">
            <wire x2="912" y1="464" y2="752" x1="912" />
            <wire x2="2736" y1="752" y2="752" x1="912" />
            <wire x2="912" y1="752" y2="992" x1="912" />
            <wire x2="928" y1="992" y2="992" x1="912" />
            <wire x2="2736" y1="992" y2="992" x1="928" />
            <wire x2="912" y1="992" y2="1216" x1="912" />
            <wire x2="2736" y1="1216" y2="1216" x1="912" />
            <wire x2="912" y1="1216" y2="1456" x1="912" />
            <wire x2="912" y1="1456" y2="2640" x1="912" />
            <wire x2="912" y1="2640" y2="2656" x1="912" />
            <wire x2="2736" y1="1456" y2="1456" x1="912" />
        </branch>
        <iomarker fontsize="28" x="1120" y="240" name="B" orien="R270" />
        <branch name="B">
            <wire x2="1120" y1="240" y2="256" x1="1120" />
            <wire x2="1216" y1="256" y2="256" x1="1120" />
            <wire x2="1120" y1="256" y2="1280" x1="1120" />
            <wire x2="2736" y1="1280" y2="1280" x1="1120" />
            <wire x2="1120" y1="1280" y2="1520" x1="1120" />
            <wire x2="2736" y1="1520" y2="1520" x1="1120" />
            <wire x2="1120" y1="1520" y2="2256" x1="1120" />
            <wire x2="2736" y1="2256" y2="2256" x1="1120" />
            <wire x2="1120" y1="2256" y2="2496" x1="1120" />
            <wire x2="1120" y1="2496" y2="2640" x1="1120" />
            <wire x2="1120" y1="2640" y2="2704" x1="1120" />
            <wire x2="2736" y1="2496" y2="2496" x1="1120" />
            <wire x2="1216" y1="192" y2="256" x1="1216" />
            <wire x2="1264" y1="192" y2="192" x1="1216" />
            <wire x2="1264" y1="192" y2="256" x1="1264" />
        </branch>
        <instance x="1232" y="256" name="XLXI_15" orien="R90" />
        <branch name="XLXN_21">
            <wire x2="1264" y1="480" y2="816" x1="1264" />
            <wire x2="1264" y1="816" y2="832" x1="1264" />
            <wire x2="1264" y1="832" y2="1056" x1="1264" />
            <wire x2="2736" y1="1056" y2="1056" x1="1264" />
            <wire x2="1264" y1="1056" y2="1776" x1="1264" />
            <wire x2="2736" y1="1776" y2="1776" x1="1264" />
            <wire x2="1264" y1="1776" y2="2016" x1="1264" />
            <wire x2="1264" y1="2016" y2="2624" x1="1264" />
            <wire x2="1264" y1="2624" y2="2704" x1="1264" />
            <wire x2="2736" y1="2016" y2="2016" x1="1264" />
            <wire x2="2736" y1="816" y2="816" x1="1264" />
        </branch>
        <branch name="Enable">
            <wire x2="368" y1="240" y2="768" x1="368" />
            <wire x2="368" y1="768" y2="944" x1="368" />
            <wire x2="2736" y1="944" y2="944" x1="368" />
            <wire x2="368" y1="944" y2="1184" x1="368" />
            <wire x2="2736" y1="1184" y2="1184" x1="368" />
            <wire x2="368" y1="1184" y2="1408" x1="368" />
            <wire x2="2736" y1="1408" y2="1408" x1="368" />
            <wire x2="368" y1="1408" y2="1648" x1="368" />
            <wire x2="2736" y1="1648" y2="1648" x1="368" />
            <wire x2="368" y1="1648" y2="1904" x1="368" />
            <wire x2="2736" y1="1904" y2="1904" x1="368" />
            <wire x2="368" y1="1904" y2="2144" x1="368" />
            <wire x2="2736" y1="2144" y2="2144" x1="368" />
            <wire x2="368" y1="2144" y2="2384" x1="368" />
            <wire x2="2736" y1="2384" y2="2384" x1="368" />
            <wire x2="368" y1="2384" y2="2624" x1="368" />
            <wire x2="368" y1="2624" y2="2656" x1="368" />
            <wire x2="2736" y1="2624" y2="2624" x1="368" />
        </branch>
        <branch name="D0">
            <wire x2="3024" y1="848" y2="848" x1="2992" />
        </branch>
        <iomarker fontsize="28" x="3024" y="848" name="D0" orien="R0" />
        <branch name="D1">
            <wire x2="3024" y1="1088" y2="1088" x1="2992" />
        </branch>
        <iomarker fontsize="28" x="3024" y="1088" name="D1" orien="R0" />
        <branch name="D2">
            <wire x2="3024" y1="1312" y2="1312" x1="2992" />
        </branch>
        <iomarker fontsize="28" x="3024" y="1312" name="D2" orien="R0" />
        <branch name="D3">
            <wire x2="3024" y1="1552" y2="1552" x1="2992" />
        </branch>
        <iomarker fontsize="28" x="3024" y="1552" name="D3" orien="R0" />
        <branch name="D4">
            <wire x2="3024" y1="1808" y2="1808" x1="2992" />
        </branch>
        <iomarker fontsize="28" x="3024" y="1808" name="D4" orien="R0" />
        <branch name="D5">
            <wire x2="3024" y1="2048" y2="2048" x1="2992" />
        </branch>
        <iomarker fontsize="28" x="3024" y="2048" name="D5" orien="R0" />
        <branch name="D6">
            <wire x2="3024" y1="2288" y2="2288" x1="2992" />
        </branch>
        <iomarker fontsize="28" x="3024" y="2288" name="D6" orien="R0" />
        <branch name="D7">
            <wire x2="3024" y1="2528" y2="2528" x1="2992" />
        </branch>
        <iomarker fontsize="28" x="3024" y="2528" name="D7" orien="R0" />
    </sheet>
</drawing>