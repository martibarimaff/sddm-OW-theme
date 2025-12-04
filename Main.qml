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


//import Qt5Compat.GraphicalEffects
//import QtQuick 2.11
import QtQuick.Controls 2.4
//import QtQuick.Layouts 1.11
import QtQuick.Window 2.11
import "Components"
import QtMultimedia

Pane {
    id: root

    height: Screen.height
    width: Screen.ScreenWidth
    
    padding: -1//config.ScreenPadding
    palette.button: "transparent"
    palette.highlight: config.AccentColour
    palette.text: config.MainColour
    palette.buttonText: config.MainColour
    palette.window: config.BackgroundColour

    font.family: config.Font
    font.pointSize: config.FontSize !== "" ? config.FontSize :
        Screen.primaryOrientation == Qt.PortraitOrientation ? parseInt(height / 160) : parseInt(height / 80)
    focus: true


    Component.onCompleted: {
        Orientation.getOrientation()
        console.log('called orientation')
    }
    Item {
        id: sizeHelper

        anchors.fill: parent
        height: parent.height
        width: parent.width
        
        LoginForm {
            id: form
            height: parent.height
            width: parent.width / 2.5
            anchors.left: parent.left
            z: 3
        }

        Image {
            id: backgroundPlaceholder

            anchors.fill: parent
            width: parent.width
            height: parent.height

            z: 1
            source: config.backgroundPlaceholder
            visible: true //gets changed on video start
        }

        AnimatedImage {
            id: background
            z: 2

            MediaPlayer {
                id: player
                
                videoOutput: videoOutput
                autoPlay: true
                playbackRate: 1.0
                loops: -1
                onPlayingChanged: {
                    console.log("Video started.")
                    backgroundPlaceholder.visible = false;
                }
            }

            VideoOutput {
                id: videoOutput
                
                fillMode: VideoOutput.PreserveAspectFit
                anchors.fill: parent
            }

            height: parent.height
            width: parent.width

            horizontalAlignment: Image.AlignHCenter

            verticalAlignment: Image.AlignVCenter

            speed: 1.0
            paused: false
            fillMode: Image.PreserveAspectFit
            asynchronous: true
            cache: true
            clip: true
            mipmap: true

            Component.onCompleted:{
                var fileType = config.Background.substring(config.Background.lastIndexOf(".") + 1)
                const videoFileTypes = ["avi", "mp4", "mov", "mkv", "m4v", "webm"];
                if (videoFileTypes.includes(fileType)) {
                    backgroundPlaceholder.visible = true;
                    player.source = Qt.resolvedUrl(config.Background)
                    player.play();
                }
                else{
                    background.source = config.background || config.Background
                }
            }
        }

        MouseArea {
            anchors.fill: background
            onClicked: parent.forceActiveFocus()
        }

    }
}

// This file is part of SDDM Eucalyptus Drop.
// A theme for the Simple Display Desktop Manager.
//
// Copyright (C) 2018–2020 Marian Arlt
// Copyright (C) 2020-2024 <matt.jolly@footclan.ninja>
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
