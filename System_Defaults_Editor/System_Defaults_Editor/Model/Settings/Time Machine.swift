//
//  Time Machine.swift
//  System_Defaults_Editor
//
//  Created by 1ris_W
//

// MARK: - Time Machine setting
extension SystemDefaultItem {

    static let timeMachineDontOfferNewDisksForTimeMachineBackup = SystemDefaultItem(
        id: "time_machine_dont_offer_new_disks_for_time_machine_backup",
        key: "DoNotOfferNewDisksForBackup",
        displayName: "Backup volumes",
        description:
            "Prevent Time Machine from prompting to use newly connected storage as backup volumes.",
        group: .timeMachine,
        defaultValue: .boolean(BooleanValue(bool: false))
    )
}
