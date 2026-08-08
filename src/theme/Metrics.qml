pragma Singleton

import QtQuick

QtObject {

    // ─────────────────────────────
    // BAR
    // ─────────────────────────────

    property bool barEnabled: true

    // Appearance
    property real barOpacity: 0.90
    property int blurRadius: 20
    property real transparency: 0.15


    // ─────────────────────────────
    // GENERAL SIZE
    // ─────────────────────────────

    property int borderWidth: 6
    property int cornerRadius: 17

    property int notchRadius: 15
    property int notchHeight: 40

    property int exclusionGap: 34
    property int spacing: 10


    // ─────────────────────────────
    // NOTCH PADDING
    // ─────────────────────────────

    property int notchPadding: 16
    property int notchHorizontalPadding: 20
    property int notchVerticalPadding: 10
    property int notchSideMargin: 10


    // ─────────────────────────────
    // NOTCH WIDTH
    // ─────────────────────────────

    property int lNotchMinWidth: 180
    property int lNotchMaxWidth: 360

    property int cNotchMinWidth: 300
    property int cNotchMaxWidth: 360

    property int rNotchMinWidth: 180
    property int rNotchMaxWidth: 360


    // ─────────────────────────────
    // DASHBOARD
    // ─────────────────────────────

    property int dashboardWidth: 900
    property int dashboardHeight: 520


    // ─────────────────────────────
    // POPUPS
    // ─────────────────────────────

    property int notificationsWidth: 400
    property int notificationToastWidth: 330
    property int networkPopupWidth: 480


    // ─────────────────────────────
    // POPUP LIMITS
    // ─────────────────────────────

    property int popupMinWidth: 160
    property int popupMaxWidth: 420

    property int popupMinHeight: 80
    property int popupMaxHeight: 520

    property int popupPadding: 16


    // ─────────────────────────────
    // WORKSPACE
    // ─────────────────────────────

    property int wsDotSize: 10
    property int wsActiveWidth: 24
    property int wsSpacing: 6
    property int wsPadding: 8
    property int wsRadius: 16


    // ─────────────────────────────
    // ANIMATION
    // ─────────────────────────────

    property int animDuration: 320

}
