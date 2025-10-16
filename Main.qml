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
    
    padding: config.ScreenPadding
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
            z: 2
        }

        Image {
            id: backgroundPlaceholderImage

            anchors.fill: parent
            width: parent.width
            height: parent.height

            z: 1
            source: "Backgrounds/ow-background.png"
            visible: true //gets changed on video start
        }

        AnimatedImage {
            id: backgroundImage

            MediaPlayer {
                id: player
                
                videoOutput: videoOutput
                autoPlay: true
                playbackRate: 1.0
                loops: -1
                onPlayingChanged: {
                    console.log("Video started.")
                    backgroundPlaceholderImage.visible = false;
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
                    backgroundPlaceholderImage.visible = true;
                    player.source = Qt.resolvedUrl(config.Background)
                    player.play();
                }
                else{
                    backgroundImage.source = config.background || config.Background
                }
            }
        }

        MouseArea {
            anchors.fill: backgroundImage
            onClicked: parent.forceActiveFocus()
        }

    }
}