/*
Copyright (C) 2018–2020 Marian Arlt
Copyright (C) 2020-2024 <matt.jolly@footclan.ninja>
Copyright (C) 2025-2026 martibarimaff

This file contains modified code originally created for "SDDM Eucalyptus Drop"
and adapted for the SDDM Outer Wilds Theme.

SDDM Outer Wilds Theme is free software: you can redistribute it and/or modify it
under the terms of the GNU General Public License as published by the
Free Software Foundation, either version 3 of the License, or any later version.

You are required to preserve this and any additional legal notices, either
contained in this file or in other files that you received along with
SDDM Outer Wilds Theme that refer to the author(s) in accordance with
sections §4, §5 and specifically §7b of the GNU General Public License.

SDDM Outer Wilds Theme is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with SDDM Outer Wilds Theme. If not, see <https://www.gnu.org/licenses/>

---------ADDITIONAL NOTICES---------
While the rest of this software is licensed under the GNU GPLv3 license,
the Outer Wilds inspired background artworks are subject to the
Mobius Digital ​Fan Content Policy & Guidelines
<https://www.mobiusdigitalgames.com/fan-content-policy.html>
and are therefore not to be sold for money
*/

import QtQuick 2.11
import QtQuick.VirtualKeyboard 2.3

InputPanel {
    id: virtualKeyboard
    property bool activated: false
    active: activated && Qt.inputMethod.visible
    visible: active
}
