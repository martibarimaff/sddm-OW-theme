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
import QtMultimedia //for MediaPlayer

Pane {
    id: root

    height: Screen.height
    width: Screen.width
    
    padding: -1 //to eliminate the leftside video artifact //temporary solution

    //Setting Colors
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
        console.log("Pane Completed")
    }


    Item {
        id: backgroundContainer

        anchors.fill: parent    

        Rectangle {
            id: backgroundPlaceholder

            anchors.fill: parent
            color: "#000000"
        }

        Image {
            id: staticBackground

            anchors.fill: parent

            source: config.StaticBackground
            fillMode: Image.PreserveAspectCrop
        }
    
        MediaPlayer {
            id: mediaPlayer
            
            videoOutput: videoOutput
            autoPlay: true
            playbackRate: 1.0
            loops: MediaPlayer.Infinite
            onPlayingChanged: {
                console.log("Video started.")
            }
        }

        VideoOutput {
            id: videoOutput
            
            anchors.fill: parent

            fillMode: VideoOutput.PreserveAspectCrop
        }

        Component.onCompleted:{
                var fileType = config.VideoBackground.substring(config.VideoBackground.lastIndexOf(".") + 1).toLowerCase()
                const videoFileTypes = ["avi", "mp4", "mov", "mkv", "m4v", "webm"];
                if (videoFileTypes.includes(fileType)) {
                    mediaPlayer.source = Qt.resolvedUrl(config.VideoBackground)
                    mediaPlayer.play();
                }
        }
    }

    LoginForm {
            id: form
            height: parent.height
            width: parent.width / 2.5
            anchors.left: parent.left
    }
}