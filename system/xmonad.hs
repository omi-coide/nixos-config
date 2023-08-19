import qualified Data.Map as M
import Graphics.X11.ExtraTypes.XF86
import System.Exit
import System.IO
import XMonad
import XMonad.Config.Desktop
import XMonad.Config.Xfce
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Layout.NoBorders
import XMonad.Layout.ResizableTile
import XMonad.Layout.Spiral
import XMonad.Layout.Tabbed
import XMonad.Operations
import XMonad.Actions.NoBorders
import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig (additionalKeys, additionalKeysP)
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.SpawnOnce
import XMonad.Actions.FloatSnap
--import XMonad.Config.Prime (TextProperty(TextProperty))

--doRaise :: ManageHook
--doRaise = ask >>= \w -> liftX $ withDisplay $ \dpy -> io (raiseWindow dpy w) >> mempty
--doLower :: ManageHook 
--doLower = ask >>= \w -> liftX $ withDisplay $ \dpy -> io (lowerWindow dpy w) >> mempty
myManageHook =
  composeAll
    [ (className =? "Xfce4-terminal" <&&> stringProperty "WM_WINDOW_ROLE" =? "xfce4-terminal-dropdown") --> doCenterFloat,
      (className =? "Wine") --> doCenterFloat,
      (className =? "Tilda") --> doCenterFloat <+> hasBorder False,
      isDialog --> doFloat,
      (className =? "Weston Compositor") --> doFloat,
      --isDialog --> doRaise <+> doFloat,
      (className =? "Vsim") --> doCenterFloat,
      (className =? "Wave") --> doCenterFloat,
      (className =? "Xfdesktop") --> doLower <+> doIgnore,
      (className =? "Kuro") --> doFloat,
      (title =? "Gnome-Pie") --> hasBorder False,
      (title =? "YLYDEBUG: Qt5") --> doFloat <+> hasBorder False,
      -- Refer to https://github.com/xmonad/xmonad/issues/151 --
      title =? "Whisker Menu" --> doCenterFloat,
      (title =? "Whisker Menu") --> hasBorder False
    ]

--,title =? "DropDownXfce4Term" --> doCenterFloat]
myStartupHook :: X ()
myStartupHook = do
  -- spawnOnce "tmux new-session -s xk -d  bash && tmux send-keys -t xk:1 'sudo xkeysnail /etc/xkeysnail/config.py --devices \"AT Translated Set 2 keyboard\"' C-m"
  -- spawnOnce "feh --bg-fill --randomize /home/yly/Pictures/Wallpapers/* &"
  -- spawnOnce "setsid xray -c ~/proxy.json"
  -- spawnOnce "fcitx5"
  -- spawnOnce "emacs --daemon"
  spawnOnce "kdeconnect-indicator"
  -- spawnOnce "xfce4-panel"
  spawnOnce "picom -b --backend glx --experimental-backends"
  -- spawnOnce "xmodmap -e \"keycode 135 = Multi_key\""
  setWMName "LG3D"

myWorkspaces = map show [1 .. 5]

myKeys conf@(XConfig {XMonad.modMask = modMask}) =
  M.fromList $
    [ ((modMask .|. shiftMask, xK_z), spawn "echo \"sleep 1; xset dpms force off\"|sh"),
      --((modMask .|. shiftMask, xK_s), spawn "sleep 1; shutdown -h now"),
      ((modMask, xK_v), spawn "emacsclient --create-frame"),
      ((controlMask, xK_Print), spawn "flameshot gui"),
      ((0, xK_Print), spawn "flameshot screen"),
      ((modMask, xK_p), spawn "xfce4-popup-whiskermenu"),
      ((modMask, xK_f), spawn "thunar"),
      ((modMask .|. controlMask, xK_d), spawn "xdotool click --repeat 2 1 key --delay 400 ctrl+c  ctrl+F12"),
      ((modMask , xK_c), spawn "xfce4-terminal --drop-down"),

      --((modMask, xK_d), spawn "goldendict"),
      ((modMask, xK_g), kill),
      ((modMask, xK_Escape), kill),
      ((modMask .|. shiftMask, xK_c), kill),
      ((modMask, xK_x), sendMessage ToggleStruts),
      ((modMask, xK_b), withFocused toggleBorder <+> refresh),
      ((modMask, xK_space), sendMessage NextLayout),
      --  Reset the layouts on the current workspace to default.
      ((modMask .|. shiftMask, xK_space), setLayout $ XMonad.layoutHook conf),
      ((modMask .|. shiftMask, xK_Return), spawn "xfce4-terminal"),
      -- Resize viewed windows to the correct size.
      ((modMask, xK_n), refresh),
      -- Move focus to the next window.
      ((modMask, xK_Tab), windows W.focusDown),
      -- Move focus to the next window.
      ((modMask, xK_j), windows W.focusDown),
      -- Move focus to the previous window.
      ((modMask, xK_k), windows W.focusUp),
      -- Move focus to the master window.
      ((modMask, xK_m), windows W.focusMaster),
      -- Swap the focused window and the master window.
      ((modMask, xK_Return), windows W.swapMaster),
      -- Swap the focused window with the next window.
      ((modMask .|. shiftMask, xK_j), windows W.swapDown),
      -- Swap the focused window with the previous window.
      ((modMask .|. shiftMask, xK_k), windows W.swapUp),
      ((modMask,               xK_Up),withFocused $ snapMove U Nothing),
    -- refer to https://gist.github.com/tomasv/912242
      -- Shrink the master area.
      ((modMask, xK_h), sendMessage Shrink),
      -- Expand the master area.
      ((modMask, xK_l), sendMessage Expand),
      -- Push window back into tiling.
      ((modMask, xK_t), withFocused $ windows . W.sink),
      -- Increment the number of windows in the master area.
      ((modMask, xK_comma), sendMessage (IncMasterN 1)),
      -- Decrement the number of windows in the master area.
      ((modMask, xK_period), sendMessage (IncMasterN (-1))),
      ((modMask .|. shiftMask, xK_q), spawn "xfce4-session-logout"),
      -- Restart xmonad.
      ((modMask, xK_q), restart "xmonad" True)
    ]
      ++ [ ((m .|. modMask, k), windows $ f i)
           | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9],
             (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
         ]
      ++
      -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
      -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
      [ ((m .|. modMask, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_a, xK_s, xK_d] [0 ..],
          (f, m) <- [(W.view, 0), (W.shift, shiftMask)]
      ]

myMouseBindings (XConfig {XMonad.modMask = modMask}) =
  M.fromList
    [ ((modMask, button1), \w -> focus w >> mouseMoveWindow w),
      ((modMask, button2), \w -> hide w),
      ((modMask, button3), \w -> focus w >> mouseResizeWindow w),
      ((modMask, button5), \w -> snapMove D Nothing w)
    -- refer to https://gist.github.com/tomasv/912242
    --  ((modMask, button5), \w -> focus w >> doRaise w)
    ]

conf =
  ewmh
    xfceConfig
      { manageHook = myManageHook <+> manageDocks <+> manageHook xfceConfig,
        layoutHook = avoidStruts $ smartBorders $ layoutHook def,
        keys = myKeys,
        mouseBindings = myMouseBindings,
        modMask = mod4Mask, -- Rebind Mod to the Windows key
        normalBorderColor = "#000080",
        focusedBorderColor = "#ff1493",
        borderWidth = 4,
        focusFollowsMouse = False,
        clickJustFocuses = True,
        workspaces = map show [1 .. 5 :: Int]
      }
  where
    tall = ResizableTall 1 (3 / 100) (1 / 2) []

main = do
  xmonad $
    conf
      { startupHook = startupHook conf >> setWMName "LG3D",
        layoutHook = avoidStruts $ smartBorders $ layoutHook def
      }
