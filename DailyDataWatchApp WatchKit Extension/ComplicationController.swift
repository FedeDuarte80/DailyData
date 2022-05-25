import ClockKit

class ComplicationController: NSObject, CLKComplicationDataSource {
    
    
    
// MARK: - Complication Configuration

    func getComplicationDescriptors(handler: @escaping ([CLKComplicationDescriptor]) -> Void) {
        let descriptors = [
            CLKComplicationDescriptor(identifier: "complication", displayName: "DailyData", supportedFamilies: CLKComplicationFamily.allCases)
            // .allCases means what type of complication you want to use
            // Multiple complication support can be added here with more descriptors
        ]
        
        // Call the handler with the currently supported complication descriptors
        handler(descriptors)
    }
    
    func handleSharedComplicationDescriptors(_ complicationDescriptors: [CLKComplicationDescriptor]) {
        // Do any necessary work to support these newly shared complication descriptors
    }

// MARK: - Timeline Configuration
    
    func getTimelineEndDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        // How long this timeline can go
//        var currentDate = Date()
//        currentDate = currentDate.addingTimeInterval(60 * 60)
//        handler(currentDate)
        
        // Call the handler with the last entry date you can currently provide or nil if you can't support future timelines
        handler(nil)
    }
    
    func getPrivacyBehavior(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationPrivacyBehavior) -> Void) {
        // hide info if watch in locked
        // Call the handler with your desired behavior when the device is locked
        handler(.showOnLockScreen)
    }

    // MARK: - Timeline Population -> the following methods crashs if the kind of complication isnt specify
    
    func getCurrentTimelineEntry(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimelineEntry?) -> Void) {
        // Call the handler with the current timeline entry
        
        if complication.family == .graphicRectangular {
            let template = CLKComplicationTemplateGraphicRectangularStandardBody(
                headerTextProvider: CLKSimpleTextProvider(text: "Header"),
                body1TextProvider: CLKSimpleTextProvider(text: "Body1"),
                body2TextProvider: CLKSimpleTextProvider(text: "Body2")
            )
            let timelineEntry = CLKComplicationTimelineEntry(date: Date(), complicationTemplate: template)
            
            handler(timelineEntry)
        }
        else {
            handler(nil)
        }
    }
    
    func getTimelineEntries(for complication: CLKComplication, after date: Date, limit: Int, withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        // Call the handler with the timeline entries after the given date
        
        if complication.family == .graphicRectangular {
            let timelineEntryArray = [CLKComplicationTimelineEntry]()
            handler(timelineEntryArray)
        }
        else {
            handler(nil)
        }
    }

    // MARK: - Sample Templates
    
    func getLocalizableSampleTemplate(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTemplate?) -> Void) {
        // This method will be called once per supported complication, and the results will be cached
        
        if complication.family == .graphicRectangular {
         let template = CLKComplicationTemplateGraphicRectangularStandardBody(
            headerTextProvider: CLKSimpleTextProvider(text: "line 1"),
            body1TextProvider: CLKSimpleTextProvider(text: "line 2"),
            body2TextProvider: CLKSimpleTextProvider(text: "line 3"))
            handler(template)
        }
        else {
            handler(nil)
        }
    }
}
