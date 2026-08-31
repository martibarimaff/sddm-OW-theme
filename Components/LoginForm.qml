/*
Copyright (C) 2025  martibarimaff

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or any
later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.

NOTE
While the rest of this software is licensed under the GNU GPLv3 license,
the Outer Wilds inspired background artworks are subject to the
Mobius Digital ​Fan Content Policy & Guidelines
<https://www.mobiusdigitalgames.com/fan-content-policy.html>
and are therefore not to be sold for money
*/
// SDDM Eucalyptus Drop Copyright at EOF

import QtQuick //2.11
import QtQuick.Layouts //1.11
import SddmComponents as SDDM //was 2.0

ColumnLayout {
    id: formContainer

    SDDM.TextConstants { id: textConstants }

    //property int p: config.ScreenPadding
    //property string a: config.FormPosition
    //property alias clockVisibility: clock.visible

    Clock {
        id: clock

        Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
        Layout.fillWidth: true
        Layout.preferredHeight: root.height / 3
    }

    Input {
        id: input

        Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
        Layout.fillWidth: true
        Layout.preferredHeight: root.height / 3
    }

}

// This file is part of SDDM Eucalyptus Drop.
// A theme for the Simple Display Desktop Manager.
//
// Copyright (C) 2018–2020 Marian Arlt
// Copyright (C) 2020–2024 Matt Jolly <matt.jolly@footclan.ninja>
//
// SDDM Eucalyptus Drop is free software: you can redistribute it and/or modify it
// under the terms of the GNU General Public License as published by the
// Free Software Foundation, either version 3 of the License, or any later version.
//
// You are required to preserve this and any additional legal notices, either
// contained in this file or in other files that you received along with
// SDDM Eucalyptus Drop that refer to the author(s) in accordance with
// sections §4, §5 and specifically §7b of the GNU General Public License.
//
// SDDM Eucalyptus Drop is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with SDDM Eucalyptus Drop. If not, see <https://www.gnu.org/licenses/>
