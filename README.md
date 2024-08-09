# Tactical Ops: Assault on Terror for Linux

Script created using TO-Fixed-Pack-v469d.7z and TOFP-LinuxFiles.zip to automate and apply the v3.5.0 patch. Original files can be found on the following page: [tactical-ops.eu].(https://tactical-ops.eu)

```bash
chmod +x tactical_ops_3.5_linux.run
./tactical_ops_v469d_linux.sh
```

## Troubleshooting

Open: nano TacticalOps.ini

- Change screen resolution if unable to do so within the game.

```bash
[WinDrv.WindowsClient]
WindowedViewportX=1024
WindowedViewportY=768
WindowedColorBits=32
```

- Switch to XOpenGLDrv driver if needed.

```bash
[Engine.Engine]
GameRenderDevice=XOpenGLDrv.XOpenGLRenderDevice
WindowedRenderDevice=XOpenGLDrv.XOpenGLRenderDevice
RenderDevice=XOpenGLDrv.XOpenGLRenderDevice
```

- Problem with Dual Monitors: disable one monitor or set the game to run on the primary monitor.

```bash
[WinDrv.WindowsClient]
StartupFullscreen=False
```

## Support

Join the Tactical Ops Community on Discord [Tactical Ops Community](https://discord.com/invite/EHMfnqr)

## Appreciation
Special thanks to **jo0Oey** for hosting the files at  [tactical-ops.eu](https://tactical-ops.eu)
