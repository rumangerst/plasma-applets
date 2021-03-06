import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1
import QtQuick.Layouts 1.1
import QtQuick.Window 2.1
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents

import QtQuick.Controls.Styles.Plasma 2.0 as PlasmaStyles

TextField {
	id: searchField
	placeholderText: {
		if (search.isDefaultFilter) {
			return i18n("Search")
		} else if (search.isAppsFilter) {
			return i18n("Search Apps")
		} else if (search.isFileFilter) {
			return i18n("Search Files")
		} else if (search.isBookmarksFilter) {
			return i18n("Search Bookmarks")
		} else {
			return i18nc("Search [krunnerName, krunnerName, ...], ", "Search %1", search.filters)
		}
	}
	// Layout.fillWidth: true
	// Layout.preferredHeight: 50
	font.pixelSize: 16 * units.devicePixelRatio // Not the same as pointSize=16

	style: plasmoid.configuration.searchFieldFollowsTheme ? plasmaStyle : redmondStyle
	Component {
		id: plasmaStyle
		// Creates the following warning when not in use:
		//   file:///usr/lib/x86_64-linux-gnu/qt5/qml/QtQuick/Controls/Styles/Plasma/TextFieldStyle.qml:74: ReferenceError: textField is not defined
		// Caused by:
		//   var actionIconSize = Math.max(textField.height * 0.8, units.iconSizes.small);
		PlasmaStyles.TextFieldStyle {}
	}
	Component {
		id: redmondStyle

		TextFieldStyle {
			background: Rectangle {
				color: "#eee"
			}
			textColor: "#111"
		}
	}

	onTextChanged: {
		search.query = text
	}
	Connections {
		target: search
		onQueryChanged: searchField.text = search.query
	}

	property var listView: searchResultsView.listView
	Keys.onPressed: {
		if (event.key == Qt.Key_Up) {
			event.accepted = true; listView.goUp()
		} else if (event.key == Qt.Key_Down) {
			event.accepted = true; listView.goDown()
		} else if (event.key == Qt.Key_PageUp) {
			event.accepted = true; listView.pageUp()
		} else if (event.key == Qt.Key_PageDown) {
			event.accepted = true; listView.pageDown()
		} else if (event.key == Qt.Key_Return) {
			event.accepted = true; listView.currentItem.trigger()
		} else if (event.modifiers & Qt.MetaModifier && event.key == Qt.Key_R) {
			event.accepted = true; search.filters = ['shell']
		} else if (event.modifiers & Qt.MetaModifier && event.key == Qt.Key_R) {
			event.accepted = true; search.filters = ['shell']
		} else if (event.key == Qt.Key_Escape) {
			plasmoid.expanded = false
		}
	}

	Component.onCompleted: {
		forceActiveFocus()
	}
}