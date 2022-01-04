/* See LICENSE file for copyright and license details. */
#include <X11/XF86keysym.h>
/* appearance */
static const unsigned int borderpx  = 4;        /* border pixel of windows */
static const unsigned int gappx     = 10;        /* gaps between windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const int vertpad            = 15;       /* vertical padding of bar */
static const int sidepad            = 15;       /* horizontal padding of bar */
static const int user_bh            = 40;        /* 0 means that dwm will calculate bar height, >= 1 means dwm will user_bh as bar height */
static const char *fonts[]          = { "MesloLGS NF:size=15"};
static const char dmenufont[]       = "MesloLGS NF:size=15";
static const char col_gray1[]       = "#282828";
static const char col_gray2[]       = "#928374";
static const char col_gray3[]       = "#ebdbb2";
static const char col_gray4[]       = "#ebdbb2";
static const char col_cyan[]        = "#282828";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
};

static const char *const autostart[] = {
/*"xrandr", "--output", "DP-2", "--mode", "2560x1440", "--pos", "0x0", "--rate", "165", "--rotate", "normal", NULL,
"xrandr", "--output", "DP-0", "--mode", "2560x1440", "--pos", "2560x0", "--rate", "144", "--rotate", "left", NULL,*/
"feh", "--bg-fill", "--no-fehbg" , "/home/jy/Pictures/wallpapers/oleg.jpg", NULL,
"picom", "--config", "/home/jy/.config/picom/picom.conf", "-c", "-C", NULL,
"slstatus", NULL,
NULL /* terminate */
};

/* tagging */
/*static const char *tags[] = { "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX" };*/
static const char *tags[] = { "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX" };

static const char *tagsel[][2] = {
	{ "#928374", "#3d3c3a" },
	{ "#fb4934", "#3d3c3a" },
	{ "#b8bb26", "#3d3c3a" },
	{ "#fabd2f", "#3d3c3a" },
	{ "#83a598", "#3d3c3a" },
	{ "#d3869b", "#3d3c3a" },
	{ "#8ec07c", "#3d3c3a" },
	{ "#ebdbb2", "#3d3c3a" },
	{ "#282828", "#3d3c3a" },
};



static const unsigned int ulinepad	= 5;	/* horizontal padding between the underline and tag */
static const unsigned int ulinestroke	= 2;	/* thickness / height of the underline */
static const unsigned int ulinevoffset	= 0;	/* how far above the bottom of the bar the line should appear */
static const int ulineall 		= 0;	/* 1 to show underline on all tags, 0 for just the active ones */


/* launcher commands (They must be NULL terminated) */
static const char* nvim[]  = { "alacritty", "-e", "nvim", NULL   };
static const char* btop[]  = { "alacritty", "-e", "btop", NULL   };

static const Launcher launchers[] = {
/* command       name to display */
{ btop,        "[Btop]"  },
{ nvim,        "[Neovim]"},
};


static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.50; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

#include "layouts.c"
#include "fibonacci.c"
static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile                   },    /* first entry is default */
	{ "><>",      NULL                   },    /* no layout function means floating behavior */
	{ "[M]",      monocle                },
	{ "[@]",      spiral                 },
 	{ "[\\]",     dwindle                },
	{ "|M|",      centeredmaster         },
	{ ">M>",      centeredfloatingmaster },
	{ "HHH",      grid                   },
	{ NULL,       NULL                   },
};

/* key definitions */
#define MODKEY Mod1Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-p", "Run:", NULL };
static const char *termcmd[]  = { "st", "-e", "tmux",  NULL 		     	                    };
static const char *emacscmd[] = { "emacs", NULL                                                     };
static const char *brwsrcmd[] = { "tabbed", "surf","-e", NULL                                       };
static const char *pwroff[]   = { "poweroff", NULL         		                            };
static const char *reboot[]   = { "reboot", NULL      			                            };
static const char *passmenu[] = { "passmenu", "-p", "Pass For:",  NULL 	                            };
static const char *upvol[]    = { "pulsemixer", "--change-volume", "+2", NULL                       };
static const char *downvol[]  = { "pulsemixer", "--change-volume", "-2", NULL                       };
static const char *mutevol[]  = { "pulsemixer", "--toggle-mute", NULL                               };
static const char *ply[]      = { "mpc", "toggle", NULL                                             };
static const char *nxttrk[]   = { "mpc", "next", NULL             	                            };
static const char *prvtrk[]   = { "mpc", "prev", NULL                                               };
static const char *mpdvu[]    = { "mpc", "volume", "+2", NULL                                       };
static const char *mpdvd[]    = { "mpc", "volume", "-2", NULL                                       };
static const char *opnvia[]   = { "via", NULL                                                       };

static Key keys[] = {
          /*Modifier(s)*/              /*Key*/                 /*Function*/          /*Argument*/
	{ MODKEY|ShiftMask,             XK_p,     		  spawn,          {.v = passmenu } },
	{ MODKEY|ControlMask,           XK_r,      		  spawn,          {.v = reboot   } },
	{ MODKEY|ControlMask,           XK_x,      		  spawn,          {.v = pwroff   } },
	{ MODKEY,                       XK_e,      		  spawn,          {.v = emacscmd } },
	{ MODKEY|ShiftMask,             XK_f,       		  spawn,          {.v = brwsrcmd } },
	{ MODKEY,                       XK_p,                     spawn,          {.v = dmenucmd } },
	{ MODKEY|ShiftMask,             XK_Return,                spawn,          {.v = termcmd  } },
        { 0,                            XF86XK_AudioLowerVolume,  spawn,          {.v = downvol  } },
	{ 0,                            XF86XK_AudioRaiseVolume,  spawn,          {.v = upvol    } },
	{ 0,                            XF86XK_AudioMute,         spawn,          {.v = mutevol  } },
	{ MODKEY,                       XK_End,                   spawn,          {.v = nxttrk    } },
	{ MODKEY,                       XK_Prior,           	  spawn,          {.v = prvtrk } },
	{ MODKEY,                       XK_Home,                  spawn,          {.v = ply } },
        { MODKEY,                       XK_Up,                    spawn,          {.v = mpdvu    } },
	{ MODKEY,                       XK_Down,                  spawn,          {.v = mpdvd    } },
	{ MODKEY,                       XK_space,                 spawn,          {.v = opnvia   } },
	{ MODKEY,                       XK_b,                     togglebar,      {0} },
	{ MODKEY,                       XK_j,                     focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,                     focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,                     incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,                     incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,                     setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,                     setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_Return,                zoom,           {0} },
	{ MODKEY,                       XK_Tab,                   view,           {0} },
	{ MODKEY,                       XK_c,                     killclient,     {0} },
	{ MODKEY,                       XK_t,      		  setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      		  setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      		  setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_r,     		  setlayout,      {.v = &layouts[3]} },
	{ MODKEY|ShiftMask,             XK_r,   	          setlayout,      {.v = &layouts[4]} },
	{ MODKEY,                       XK_u,     		  setlayout,      {.v = &layouts[5]} },
	{ MODKEY,                       XK_o,    		  setlayout,      {.v = &layouts[6]} },
	{ MODKEY,                       XK_g,    		  setlayout,      {.v = &layouts[7]} },
	{ MODKEY|ControlMask,		XK_comma,		  cyclelayout,    {.i = -1 } },
	{ MODKEY|ControlMask,           XK_period,		  cyclelayout,    {.i = +1 } },
	{ MODKEY,                       XK_0,      		  view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,    		  tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,		  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period,		  focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,		  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period,		  tagmon,         {.i = +1 } },
	{ MODKEY|ControlMask|ShiftMask,  XK_q,                     setlayout,      {.v = &layouts[0]} },
	{ MODKEY|ControlMask|ShiftMask,  XK_w,                     setlayout,      {.v = &layouts[1]} },
	{ MODKEY|ControlMask|ShiftMask,  XK_e,                     setlayout,      {.v = &layouts[2]} },
	{ MODKEY|ControlMask|ShiftMask,  XK_r,                     setlayout,      {.v = &layouts[3]} },
	{ MODKEY|ControlMask|ShiftMask,  XK_t,                     setlayout,      {.v = &layouts[4]} },
	{ MODKEY|ControlMask|ShiftMask,  XK_y,                     setlayout,      {.v = &layouts[5]} },
	{ MODKEY|ControlMask|ShiftMask,  XK_u,                     setlayout,      {.v = &layouts[6]} },
	{ MODKEY|ControlMask|ShiftMask,  XK_i,                     setlayout,      {.v = &layouts[7]} },



	TAGKEYS(                        XK_1,                                     0)
	TAGKEYS(                        XK_2,                     		  1)
	TAGKEYS(                        XK_3,                     		  2)
	TAGKEYS(                        XK_4,                    		  3)
	TAGKEYS(                        XK_5,                    		  4)
	TAGKEYS(                        XK_6,                    		  5)
	TAGKEYS(                        XK_7,                    		  6)
	TAGKEYS(                        XK_8,                    		  7)
	TAGKEYS(                        XK_9,                      		  8)
	{ MODKEY|ShiftMask,             XK_q,      		   quit,          {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
         /* click*/       /* event mask*/      /*button*/       /*function*/        /*argument*/
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0}                },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0}                },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd }    },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0}                },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0}                },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0}                },
	{ ClkTagBar,            0,              Button1,        view,           {0}                },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0}                },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0}                },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0}                },
};

