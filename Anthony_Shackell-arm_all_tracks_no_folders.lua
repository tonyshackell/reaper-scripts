-- @version 1.0.1
-- @author Anthony Shackell
-- @description Arm all tracks except for parent folders


-- DEBUG FUNCTIONS

function debugTable(t)
  local str = ''
  reaper.ShowConsoleMsg('------ debug table ------ \n')
  for i, v in pairs(t) do
    str = str..i..' = '..tostring(v)..'\n'
  end
  reaper.ShowConsoleMsg(str..'\n')
end

function debugTrack(track)
local str = ''
  reaper.ShowConsoleMsg('------ debug track ------ \n')
  str = str..'track = '..tostring(track)..'\n'
  reaper.ShowConsoleMsg(str..'\n')
end

-- BEGIN FUNCTIONALITY

function GetNonFolderTracks()
  local  matched_tr_guids = {}
  for i = 1, reaper.CountTracks(0) do
    track = reaper.GetTrack(0, i-1)
    is_folder = reaper.GetMediaTrackInfo_Value(track, 'I_FOLDERDEPTH')
    if is_folder ~= 1 then
      matched_tr_guids[#matched_tr_guids+1] = reaper.GetTrackGUID(track)
    end
  end
  return matched_tr_guids
end
  
track_guids = GetNonFolderTracks()

for track_num, track in pairs(track_guids) do
  sel_track = reaper.BR_GetMediaTrackByGUID(0, track)
  reaper.SetMediaTrackInfo_Value(sel_track, 'I_RECARM', 1)
end
  
