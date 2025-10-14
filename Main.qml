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


While the rest of this software is licensed under the GNU GPLv3 license,
the Outer Wilds inspired background artworks are subject to the
Mobius Digital ​Fan Content Policy & Guidelines
<https://www.mobiusdigitalgames.com/fan-content-policy.html>
and are therefore not to be sold for money
*/


import Qt5Compat.GraphicalEffects
import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.11
import QtQuick.Window 2.11
import "Components"
import QtMultimedia

Pane {
    id: root

    height: Screen.height
    width: Screen.ScreenWidth

    //LayoutMirroring.enabled: config.ForceRightToLeft == "true" ? true : Qt.application.layoutDirection === Qt.RightToLeft
    //LayoutMirroring.childrenInherit: true

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

    property bool leftleft: config.HaveFormBackground == "true" &&
                            config.PartialBlur == "false" &&
                            config.FormPosition == "left" &&
                            config.BackgroundImageHAlignment == "left"

    property bool leftcenter: config.HaveFormBackground == "true" &&
                              config.PartialBlur == "false" &&
                              config.FormPosition == "left" &&
                              config.BackgroundImageHAlignment == "center"

    property bool rightright: config.HaveFormBackground == "true" &&
                              config.PartialBlur == "false" &&
                              config.FormPosition == "right" &&
                              config.BackgroundImageHAlignment == "right"

    property bool rightcenter: config.HaveFormBackground == "true" &&
                               config.PartialBlur == "false" &&
                               config.FormPosition == "right" &&
                               config.BackgroundImageHAlignment == "center"
    Component.onCompleted: {
        Orientation.getOrientation()
        console.log('called orientation')
    }
    Item {
        id: sizeHelper

        anchors.fill: parent
        height: parent.height
        width: parent.width

        Rectangle { //black rectangle that occupy all screen what the purpose? idk
            id: tintLayer
            anchors.fill: parent
            width: parent.width
            height: parent.height
            color: "Black"
            opacity: 1.0
            z: 0
        }

        // Rectangle {
        //     id: formBackground
        //     anchors.fill: form
        //     anchors.centerIn: form
        //     color: root.palette.window
        //     visible: config.HaveFormBackground == "true" ? true : false
        //     opacity: config.PartialBlur == "true" ? 0.3 : 1
        //     z: 1
        // }

        LoginForm {
            id: form
            height: parent.height
            // If in portrait orientation we should take up half instead of 40% of the screen to avoid crowding
            width: parent.width / 2.5
            anchors.horizontalCenter: config.FormPosition == "center" ? parent.horizontalCenter : undefined
            anchors.left: config.FormPosition == "left" ? parent.left : undefined
            //anchors.right: config.FormPosition == "right" ? parent.right : undefined
            //virtualKeyboardActive: virtualKeyboard.state == "visible" ? true : false
            z: 2
        }

        // Button {
        //     id: vkb
        //     onClicked: virtualKeyboard.switchState()
        //     visible: virtualKeyboard.status == Loader.Ready && config.ForceHideVirtualKeyboardButton == "false"
        //     anchors.bottom: parent.bottom
        //     anchors.bottomMargin: implicitHeight
        //     anchors.horizontalCenter: form.horizontalCenter
        //     z: 1
        //     contentItem: Text {
        //         text: config.TranslateVirtualKeyboardButton || "Virtual Keyboard"
        //         color: parent.visualFocus ? palette.highlight : palette.text
        //         font.pointSize: root.font.pointSize * 0.8
        //     }
        //     background: Rectangle {
        //         id: vkbbg
        //         color: "transparent"
        //     }
        // }

        // Loader {
        //     id: virtualKeyboard
        //     source: "Components/VirtualKeyboard.qml"
        //     state: "hidden"
        //     property bool keyboardActive: item ? item.active : false
        //     onKeyboardActiveChanged: keyboardActive ? state = "visible" : state = "hidden"
        //     width: parent.width
        //     z: 1
        //     function switchState() { state = state == "hidden" ? "visible" : "hidden" }
        //     states: [
        //         State {
        //             name: "visible"
        //             PropertyChanges {
        //                 target: form
        //                 systemButtonVisibility: false
        //                 clockVisibility: false
        //             }
        //             PropertyChanges {
        //                 target: virtualKeyboard
        //                 y: root.height - virtualKeyboard.height
        //                 opacity: 1
        //             }
        //         },
        //         State {
        //             name: "hidden"
        //             PropertyChanges {
        //                 target: virtualKeyboard
        //                 y: root.height - root.height/4
        //                 opacity: 0
        //             }
        //         }
        //     ]
        //     transitions: [
        //         Transition {
        //             from: "hidden"
        //             to: "visible"
        //             SequentialAnimation {
        //                 ScriptAction {
        //                     script: {
        //                         virtualKeyboard.item.activated = true;
        //                         Qt.inputMethod.show();
        //                     }
        //                 }
        //                 ParallelAnimation {
        //                     NumberAnimation {
        //                         target: virtualKeyboard
        //                         property: "y"
        //                         duration: 100
        //                         easing.type: Easing.OutQuad
        //                     }
        //                     OpacityAnimator {
        //                         target: virtualKeyboard
        //                         duration: 100
        //                         easing.type: Easing.OutQuad
        //                     }
        //                 }
        //             }
        //         },
        //         Transition {
        //             from: "visible"
        //             to: "hidden"
        //             SequentialAnimation {
        //                 ParallelAnimation {
        //                     NumberAnimation {
        //                         target: virtualKeyboard
        //                         property: "y"
        //                         duration: 100
        //                         easing.type: Easing.InQuad
        //                     }
        //                     OpacityAnimator {
        //                         target: virtualKeyboard
        //                         duration: 100
        //                         easing.type: Easing.InQuad
        //                     }
        //                 }
        //                 ScriptAction {
        //                     script: {
        //                         Qt.inputMethod.hide();
        //                     }
        //                 }
        //             }
        //         }
        //     ]
        // }

        /*Image {
            id: backgroundImage

            height: parent.height
            width: config.HaveFormBackground == "true" && config.FormPosition != "center" && config.PartialBlur != "true" ? parent.width - formBackground.width : parent.width
            anchors.left: leftleft ||
                          leftcenter ?
                                formBackground.right : undefined

            anchors.right: rightright ||
                           rightcenter ?
                                formBackground.left : undefined

            horizontalAlignment: config.BackgroundImageHAlignment == "left" ?
                                 Image.AlignLeft :
                                 config.BackgroundImageHAlignment == "right" ?
                                 Image.AlignRight : Image.AlignHCenter

            verticalAlignment: config.BackgroundImageVAlignment == "top" ?
                               Image.AlignTop :
                               config.BackgroundImageVAlignment == "bottom" ?
                               Image.AlignBottom : Image.AlignVCenter

            source: "Backgrounds/ow-background.mp4" || config.Background
            fillMode: config.ScaleImageCropped == "true" ? Image.PreserveAspectCrop : Image.PreserveAspectFit
            asynchronous: true
            cache: true
            clip: true
            mipmap: true
        }*/

        Image {
            id: backgroundPlaceholderImage

            z: 1
            source: "Backgrounds/ow-background.png"
            visible: true //changed
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
            anchors.left: leftleft || leftcenter ? formBackground.right : undefined
            //anchors.right: rightright || rightcenter ? formBackground.left : undefined

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

        // ShaderEffectSource {
        //     id: blurMask

        //     sourceItem: backgroundImage
        //     width: form.width
        //     height: parent.height
        //     anchors.centerIn: form
        //     sourceRect: Qt.rect(x,y,width,height)
        //     visible: config.FullBlur == "true" || config.PartialBlur == "true" ? true : false
        // }
    }
}