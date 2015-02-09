function Initialize()

    msMeasureDirection = SKIN:GetMeasure('MeasureDirection')
	msMeasureSpeed = SKIN:GetMeasure('MeasureSpeed')
	msMeasureUnit = SKIN:GetMeasure('MeasureUnit')
	sCalmColor = SKIN:GetVariable('CalmColor')
	sLowColor = SKIN:GetVariable('LowColor')
	sMediumColor = SKIN:GetVariable('MediumColor')
	sHighColor = SKIN:GetVariable('HighColor')
    
    Directions = {
        { 'N',    'North'              },
        { 'NbE',  'North by East'      },
        { 'NNE',  'North-Northeast'    },
        { 'NEbN', 'Northeast by North' },
        { 'NE',   'Northeast'          },
        { 'NEbE', 'Northeast by East'  },
        { 'ENE',  'East-Northeast'     },
        { 'EbN',  'East by North'      },
        { 'E',    'East'               },
        { 'EbS',  'East by South'      },
        { 'ESE',  'East-Southeast'     },
        { 'SEbE', 'Southeast by East'  },
        { 'SE',   'Southeast'          },
        { 'SEbS', 'Southeast by South' },
        { 'SSE',  'South-Southeast'    },
        { 'SbE',  'South by East'      },
        { 'S',    'South'              },
        { 'SbW',  'South by West'      },
        { 'SSW',  'South-Southwest'    },
        { 'SWbS', 'Southwest by South' },
        { 'SW',   'Southwest'          },
        { 'SWbW', 'Southwest by West'  },
        { 'WSW',  'West-Southwest'     },
        { 'WbS',  'West by South'      },
        { 'W',    'West'               },
        { 'WbN',  'West by North'      },
        { 'WNW',  'West-Northwest'     },
        { 'NWbW', 'Northwest by West'  },
        { 'NW',   'Northwest'          },
        { 'NWbN', 'Northwest by North' },
        { 'NNW',  'North-Northwest'    },
        { 'NbW',  'North by West'      }
    }

end -- function Initialize

function Update()
    
	iSkinSpeed = tonumber(msMeasureSpeed:GetStringValue())
	sSkinUnit = msMeasureUnit:GetStringValue()
	SKIN:Bang('!SetOption', 'MeterSpeed', 'Text', iSkinSpeed..' '..sSkinUnit)
	
	if iSkinSpeed == 0 then
		SKIN:Bang('!SetOption', 'MeterCompassHand', 'ImageTint', sCalmColor)
		SKIN:Bang('!SetOption', 'MeterSpeed', 'Text', 'Calm')
	elseif iSkinSpeed <= 10 then
		SKIN:Bang('!SetOption', 'MeterCompassHand', 'ImageTint', sLowColor)
	elseif iSkinSpeed <= 20 then
		SKIN:Bang('!SetOption', 'MeterCompassHand', 'ImageTint', sMediumColor)
	else
		SKIN:Bang('!SetOption', 'MeterCompassHand', 'ImageTint', sHighColor)
	end	

	iSkinDirection = math.floor((msMeasureDirection:GetValue() / 11.25) + 1.5)
    iSkinDirection = (iSkinDirection >= 33) and (iSkinDirection - 32) or iSkinDirection
	
    SKIN:Bang('!SetOption', 'MeterDirectionAbbr', 'Text', Directions[iSkinDirection][1])
    SKIN:Bang('!SetOption', 'MeterDirectionText', 'Text', Directions[iSkinDirection][2])
    
    SKIN:Bang('!DisableMeasure', 'MeasureLuaScript')
	
	return Directions[iSkinDirection][2]
    
end -- function Update