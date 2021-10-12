-- @version 1.0
-- @author Anthony Shackell
-- @description Apply track coloring to selected tracks' parent


for idx=1, reaper.CountSelectedTracks(0) do 
  track = reaper.GetSelectedTrack(0, idx-1)
  -- get the parent of the currently selected track
  parent = reaper.GetParentTrack(track)
  color = reaper.GetMediaTrackInfo_Value(track, 'I_CUSTOMCOLOR')
  reaper.SetMediaTrackInfo_Value(parent, 'I_CUSTOMCOLOR', color)
end
