如果 州._debugGui 然后
			州._debugGui.启用 = 假
		结束
	结束)
结束

功能 FlyController用户界面.更新调试框架布局(州)
	当地 调试帧 = 州._debugFrame
	当地 调试 = 州._debugGui
	如果 不 调试帧 或 不 调试 然后 返回 结束
	当地 abs尺寸 = 调试.绝对大小
	当地 屏幕W = abs尺寸.X
	当地 屏幕H = abs尺寸.Y
	当地 最小W,最小H = 240,320
	当地 最大W,最大H = 480,600
	当地 框架W = 数学.钳(数学地板(屏幕W * 0.35),最小W,最大W)
	当地 框架H = 数学.钳(数学地板(屏幕H * 0.5),最小H,最大H)
	调试帧.大小 = UDim2.新增功能(0,框架W,0,框架H)
	调试帧.位置 = UDim2.新增功能(0.5,-框架W//2,0.2,0)
结束

功能 FlyController用户界面.startDebug自动刷新(州)
	如果 州.调试自动刷新 然后 返回 结束
	州.调试自动刷新 = 真
	任务.产卵(功能()
		而 州.调试自动刷新 做
			任务.等(1)
			如果 州._debugGui 和 州._debugGui.启用 和 州._debugFrame 然后
				FlyController用户界面.refreshDebugUI(州)
			结束
		结束
	结束)
结束

功能 FlyController用户界面.停止调试自动刷新(州)
	州.调试自动刷新 = 假
结束

--手机端虚拟按钮
功能 FlyController用户界面.创建触摸UI(选手,州,toggleFly回调)
	如果 不 选手 然后 返回 结束
	当地 图形用户界面 = 实例.新增功能("屏幕GUI")
	图形用户界面.名字 = "戊飞行"
	图形用户界面.重位生成（ResetOnSpawn） = 假
	图形用户界面.忽略 GuiInset = 真
	图形用户界面.父母 = 选手:等待孩子("玩家Gui")
	州._touchGui = 图形用户界面

	当地 btn大小 = UDim2.新增功能(0,60,0,60)
	当地 底部Y = 0.7

	当地 flyBtn = 实例.新增功能("文本按钮")
	flyBtn.大小 = btn大小
	flyBtn.位置 = UDim2.新增功能(0.85,0,底部Y,0)
	flyBtn.背景颜色3 = 颜色3.来自RGB(80,120,200)
	flyBtn.发短信 = "飞行"
	flyBtn.文本颜色3 = 颜色3.新增功能(1,1,1)
	flyBtn.文本大小 = 22
	flyBtn.字体 = 枚举.字体.来源SansBold
	flyBtn.父母 = 图形用户界面

	flyBtn.鼠标按钮1点:连接(功能()
		当地 现在 = 作系统时钟()
		如果 现在 - 州.lastToggleTime < 州.切换冷却时间 然后
			返回
		结束
		州.lastToggleTime = 现在
		如果 toggleFly回调 然后 toggleFly回调() 结束
		如果 州.飞行 然后
			flyBtn.背景颜色3 = 颜色3.来自RGB(120,200,80)
			flyBtn.发短信 = "飞行中"
		还
			flyBtn.背景颜色3 = 颜色3.来自RGB(80,120,200)
			flyBtn.发短信 = "飞行"
		结束
	结束)

	当地 debugBtn = 实例.新增功能("文本按钮")
	debugBtn.大小 = UDim2.新增功能(0,60,0,60)
	debugBtn.位置 = UDim2.新增功能(0.85,0,底部Y-0.13,0)
	debugBtn.背景颜色3 = 颜色3.来自RGB(200,180,60)
	debugBtn.发短信 = "调试"
	debugBtn.文本颜色3 = 颜色3.新增功能(0,0,0)
	debugBtn.文本大小 = 22
	debugBtn.字体 = 枚举.字体.来源SansBold
	debugBtn.父母 = 图形用户界面

	debugBtn.鼠标按钮1点:连接(功能()
		当地 现在 = 作系统时钟()
		如果 现在 - 州.最后调试时间 < 州.调试冷却时间 然后
			返回
		结束
		州.最后调试时间 = 现在
		FlyController用户界面.createDebugUI(选手,州)
	结束)

	当地 功能 createDirBtn(名字,位置,目录键)
		当地 BTN = 实例.新增功能("文本按钮")
		BTN.大小 = UDim2.新增功能(0,48,0,48)
		BTN.位置 = 位置
		BTN.背景颜色3 = 颜色3.来自RGB(60,60,60)
		BTN.发短信 = 名字
		BTN.文本颜色3 = 颜色3.新增功能(1,1,1)
		BTN.文本大小 = 20
		BTN.字体 = 枚举.字体.来源SansBold
		BTN.父母 = 图形用户界面

		BTN.鼠标按钮1向下:连接(功能()
			州.移动方向[目录键] = 真
		结束)
		BTN.鼠标按钮1Up:连接(功能()
			州.移动方向[目录键] = 假
		结束)
	结束

	当地 baseX = 0.08
	当地 基Y基 = 0.7
	createDirBtn("前",UDim2.新增功能(baseX+0.07,0,基Y基,0),"向前")
	createDirBtn("后",UDim2.新增功能(baseX+0.07,0,基Y基+0.12,0),"返回")
	createDirBtn("左",UDim2.新增功能(baseX,0,基Y基+0.06,0),"左")
	createDirBtn("右",UDim2.新增功能(baseX+0.14,0,基Y基+0.06,0),"右")
	createDirBtn("上",UDim2.新增功能(baseX+0.22,0,基Y基,0),"向上")
	createDirBtn("下",UDim2.新增功能(baseX+0.22,0,基Y基+0.12,0),"下")

	FlyController用户界面.应用UIScale(图形用户界面)
结束

返回 FlyController用户界面
