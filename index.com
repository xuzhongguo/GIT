<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>🌈 童年温暖回溯 | 趣味心理探索之旅 ✨</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'PingFang SC', 'Microsoft YaHei', sans-serif;
            background: linear-gradient(135deg, #FFE4E1 0%, #FFF0F5 50%, #F0FFF0 100%);
            min-height: 100vh;
            line-height: 1.6;
            color: #5D4E37;
        }

        .container {
            max-width: 900px;
            margin: 0 auto;
            padding: 20px;
        }

        .header {
            text-align: center;
            margin: 40px 0;
            animation: fadeIn 1s ease-in;
        }

        .header h1 {
            color: #FF69B4;
            font-size: 2.8rem;
            margin-bottom: 15px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
        }

        .header p {
            color: #8B7355;
            font-size: 1.1rem;
            line-height: 1.8;
        }

        .start-btn {
            background: linear-gradient(45deg, #FF69B4, #FFB6C1);
            color: white;
            border: none;
            padding: 18px 50px;
            font-size: 1.3rem;
            border-radius: 35px;
            cursor: pointer;
            margin: 25px 0;
            transition: all 0.3s ease;
            box-shadow: 0 6px 20px rgba(255, 182, 193, 0.4);
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }

        .start-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(255, 182, 193, 0.5);
        }

        .test-section {
            display: none;
            animation: slideIn 0.5s ease-out;
        }

        .question-card {
            background: rgba(255, 255, 255, 0.92);
            border-radius: 25px;
            padding: 35px;
            margin: 20px 0;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            border: 2px solid rgba(255, 182, 193, 0.3);
            backdrop-filter: blur(10px);
        }

        .question-header {
            color: #FF69B4;
            font-size: 1.4rem;
            margin-bottom: 25px;
            font-weight: 600;
        }

        .question-number {
            background: linear-gradient(45deg, #FF69B4, #FFB6C1);
            color: white;
            display: inline-block;
            width: 35px;
            height: 35px;
            line-height: 35px;
            text-align: center;
            border-radius: 50%;
            margin-right: 12px;
            font-weight: bold;
        }

        .options {
            margin: 25px 0;
        }

        .option {
            display: block;
            margin: 18px 0;
            padding: 18px 25px;
            background: white;
            border: 2px solid #FFE4E1;
            border-radius: 18px;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .option::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, #FFF0F5, #FFE4E1);
            transition: left 0.3s ease;
            z-index: -1;
        }

        .option:hover::before {
            left: 0;
        }

        .option:hover {
            border-color: #FFB6C1;
            transform: translateX(8px);
            box-shadow: 0 4px 12px rgba(255, 182, 193, 0.2);
        }

        .option input[type="radio"] {
            margin-right: 15px;
            transform: scale(1.2);
        }

        .navigation {
            display: flex;
            justify-content: space-between;
            margin: 35px 0;
        }

        .nav-btn {
            background: linear-gradient(45deg, #FFB6C1, #FFC0CB);
            color: white;
            border: none;
            padding: 15px 35px;
            border-radius: 28px;
            cursor: pointer;
            transition: all 0.3s ease;
            font-size: 1.1rem;
        }

        .nav-btn:disabled {
            background: #DDA0DD;
            cursor: not-allowed;
            opacity: 0.6;
        }

        .nav-btn:hover:not(:disabled) {
            transform: translateY(-2px);
            box-shadow: 0 6px 18px rgba(255, 182, 193, 0.4);
        }

        .result-section {
            display: none;
            animation: fadeIn 1s ease-in;
        }

        .result-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 30px;
            padding: 45px;
            margin: 25px 0;
            box-shadow: 0 15px 40px rgba(0,0,0,0.12);
            border: 3px solid rgba(255, 182, 193, 0.4);
            backdrop-filter: blur(10px);
        }

        .result-type {
            font-size: 2.5rem;
            color: #FF69B4;
            text-align: center;
            margin-bottom: 30px;
            font-weight: 600;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
        }

        .score-display {
            text-align: center;
            font-size: 1.6rem;
            color: #8B7355;
            margin-bottom: 35px;
            font-weight: 500;
        }

        .result-content {
            margin: 30px 0;
            line-height: 1.8;
            font-size: 1.15rem;
        }

        .result-content h3 {
            color: #FF69B4;
            margin: 25px 0 15px 0;
            font-size: 1.4rem;
        }

        .result-content p {
            margin: 12px 0;
            color: #5D4E37;
        }

        .feature-list {
            background: linear-gradient(45deg, #FFF0F5, #F0FFFF);
            padding: 25px;
            border-radius: 20px;
            margin: 25px 0;
            border-left: 5px solid #FFB6C1;
        }

        .feature-list ul {
            margin-left: 20px;
        }

        .feature-list li {
            margin: 12px 0;
            color: #5D4E37;
            font-size: 1.1rem;
        }

        .advice-card {
            background: linear-gradient(45deg, #F0FFF0, #FFF0F5);
            padding: 25px;
            border-radius: 20px;
            margin: 25px 0;
            border-left: 5px solid #90EE90;
        }

        .celebrity-quote {
            background: linear-gradient(45deg, #FFE4E1, #FFF0F5);
            padding: 25px;
            border-radius: 20px;
            margin: 25px 0;
            font-style: italic;
            text-align: center;
            border-left: 5px solid #FFB6C1;
            font-size: 1.1rem;
            line-height: 1.8;
        }

        .warm-message {
            background: linear-gradient(45deg, #FFF0F5, #FFE4E1);
            padding: 30px;
            border-radius: 25px;
            margin: 35px 0;
            font-style: italic;
            text-align: center;
            border-left: 6px solid #FF69B4;
            font-size: 1.2rem;
            line-height: 1.9;
            box-shadow: 0 5px 15px rgba(255, 182, 193, 0.2);
        }

        .restart-btn {
            background: linear-gradient(45deg, #98FB98, #90EE90);
            color: white;
            border: none;
            padding: 18px 45px;
            font-size: 1.2rem;
            border-radius: 32px;
            cursor: pointer;
            margin: 25px auto;
            display: block;
            transition: all 0.3s ease;
            box-shadow: 0 6px 18px rgba(144, 238, 144, 0.3);
        }

        .restart-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(144, 238, 144, 0.4);
        }

        .progress-bar {
            width: 100%;
            height: 12px;
            background: rgba(255, 182, 193, 0.2);
            border-radius: 15px;
            margin: 25px 0;
            overflow: hidden;
            box-shadow: inset 0 2px 4px rgba(0,0,0,0.1);
        }

        .progress-fill {
            height: 100%;
            background: linear-gradient(45deg, #FF69B4, #FFB6C1);
            border-radius: 15px;
            transition: width 0.5s ease;
            width: 0%;
            box-shadow: 0 2px 6px rgba(255, 182, 193, 0.3);
        }

        .emoji-decoration {
            font-size: 2rem;
            margin: 0 8px;
            animation: bounce 2s infinite;
        }

        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes slideIn {
            from { opacity: 0; transform: translateX(-20px); }
            to { opacity: 1; transform: translateX(0); }
        }

        .hearts {
            position: fixed;
            width: 100%;
            height: 100%;
            pointer-events: none;
            overflow: hidden;
            z-index: 1;
        }

        .heart {
            position: absolute;
            color: rgba(255, 182, 193, 0.6);
            animation: float 8s infinite ease-in-out;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0) rotate(0deg); }
            50% { transform: translateY(-20px) rotate(10deg); }
        }

        .mbti-section {
            background: linear-gradient(45deg, #F0F8FF, #FFF0F5);
            padding: 25px;
            border-radius: 20px;
            margin: 25px 0;
            border: 2px solid rgba(255, 182, 193, 0.2);
        }

        .compatibility-section {
            background: linear-gradient(45deg, #FFF8DC, #FFF0F5);
            padding: 25px;
            border-radius: 20px;
            margin: 25px 0;
            border: 2px solid rgba(255, 215, 0, 0.2);
        }

        .growth-path {
            background: linear-gradient(45deg, #F5FFFA, #FFF0F5);
            padding: 25px;
            border-radius: 20px;
            margin: 25px 0;
            border: 2px solid rgba(152, 251, 152, 0.2);
        }
    </style>
</head>
<body>
    <div class="hearts" id="hearts"></div>

    <div class="container">
        <!-- 欢迎页面 -->
        <div class="welcome-section" id="welcomeSection">
            <div class="header">
                <h1>🌈 童年温暖回溯之旅 ✨</h1>
                <p>亲爱的朋友，这不是一个让你沉浸在过去的测试，</p>
                <p>而是一次有趣又深刻的心灵探索之旅！</p>
                <p>每个人的成长都是独特的故事，了解自己小时候的样子，</p>
                <p>是为了更好地拥抱现在这个闪闪发光的你！💫</p>
            </div>

            <div class="question-card">
                <h3 style="color: #FF69B4; margin-bottom: 20px;">
                    <span class="emoji-decoration">🎯</span> 测试说明
                    <span class="emoji-decoration">🌟</span>
                </h3>
                <ul style="margin-left: 25px; color: #5D4E37; font-size: 1.1rem;">
                    <li>🎪 15道精心设计的趣味题目，带你回到童年时光</li>
                    <li>💖 没有标准答案，你的真实感受就是最好的答案</li>
                    <li>🎨 测试结果会从多个维度分析你的童年印记</li>
                    <li>🌟 记得对自己温柔一点，探索内心需要勇气</li>
                    <li>✨ 准备好了吗？让我们一起开始这场奇妙的心灵之旅吧！</li>
                </ul>
            </div>

            <div style="text-align: center;">
                <button class="start-btn" onclick="startTest()">🎪 开启温暖之旅 ✨</button>
            </div>
        </div>

        <!-- 测试部分 -->
        <div class="test-section" id="testSection">
            <div class="progress-bar">
                <div class="progress-fill" id="progressFill"></div>
            </div>

            <div id="questionContainer"></div>

            <div class="navigation">
                <button class="nav-btn" id="prevBtn" onclick="previousQuestion()" disabled>⬅️ 上一题</button>
                <button class="nav-btn" id="nextBtn" onclick="nextQuestion()">下一题 ➡️</button>
                <button class="nav-btn" id="submitBtn" onclick="showResult()" style="display: none;">🎉 查看结果</button>
            </div>
        </div>

        <!-- 结果部分 -->
        <div class="result-section" id="resultSection">
            <div class="result-card">
                <div class="result-type" id="resultType"></div>
                <div class="score-display" id="scoreDisplay"></div>

                <div class="result-content" id="resultContent"></div>

                <div class="warm-message" id="warmMessage"></div>

                <button class="restart-btn" onclick="restartTest()">🔄 重新开始测试</button>
            </div>
        </div>
    </div>

    <script>
        const questions = [
            {
                id: 1,
                question: "当遇到困难或挫折时，你通常的第一反应是：",
                options: [
                    { text: "立刻寻求他人的帮助和安慰", value: 1 },
                    { text: "独自承受，不想给别人添麻烦", value: 2 },
                    { text: "感到恐慌，不知所措", value: 3 },
                    { text: "理性分析，冷静处理", value: 4 }
                ]
            },
            {
                id: 2,
                question: "对他人建立信任，对你来说：",
                options: [
                    { text: "很容易，天生愿意相信别人", value: 1 },
                    { text: "需要时间观察和了解", value: 2 },
                    { text: "非常困难，总是怀疑他人的动机", value: 3 },
                    { text: "只信任特定的人，其他人很难进入内心", value: 4 }
                ]
            },
            {
                id: 3,
                question: "表达自己的真实感受时，你会：",
                options: [
                    { text: "自然流露，不在意他人看法", value: 1 },
                    { text: "会考虑场合和对象，选择性表达", value: 2 },
                    { text: "经常压抑，害怕被误解或拒绝", value: 3 },
                    { text: "更愿意通过文字或行动表达，而非言语", value: 4 }
                ]
            },
            {
                id: 4,
                question: "在亲密关系中，你最担心的是：",
                options: [
                    { text: "失去自我，过度依赖对方", value: 1 },
                    { text: "被伤害或背叛", value: 2 },
                    { text: "不够好，配不上对方的爱", value: 3 },
                    { text: "关系变得平淡，失去激情", value: 4 }
                ]
            },
            {
                id: 5,
                question: "当被批评或指责时，你的内心反应是：",
                options: [
                    { text: "虚心接受，努力改进", value: 1 },
                    { text: "会自我怀疑，感到沮丧", value: 2 },
                    { text: "立即防御，甚至反击", value: 3 },
                    { text: "表面平静，内心受伤", value: 4 }
                ]
            },
            {
                id: 6,
                question: "童年最深刻的记忆是：",
                options: [
                    { text: "温暖的家庭时光", value: 1 },
                    { text: "父母的期望和要求", value: 2 },
                    { text: "孤独或被忽视的感受", value: 3 },
                    { text: "充满不确定性的家庭环境", value: 4 }
                ]
            },
            {
                id: 7,
                question: "面对权威和规则时，你倾向于：",
                options: [
                    { text: "尊重并遵守，相信有其合理性", value: 1 },
                    { text: "质疑挑战，不愿盲目服从", value: 2 },
                    { text: "极度恐惧违规带来的后果", value: 3 },
                    { text: "规则对我影响不大，我按自己的方式生活", value: 4 }
                ]
            },
            {
                id: 8,
                question: "你认为爱应该是：",
                options: [
                    { text: "无条件的包容和接纳", value: 1 },
                    { text: "通过努力和付出来换取", value: 2 },
                    { text: "带有条件的，需要达到某种标准", value: 3 },
                    { text: "更多体现在行动而非言语中", value: 4 }
                ]
            },
            {
                id: 9,
                question: "在生活的各个层面，你更倾向于：",
                options: [
                    { text: "保持独立，不轻易依赖他人", value: 1 },
                    { text: "在某些方面依赖，其他方面独立", value: 2 },
                    { text: "渴望依赖但又害怕", value: 3 },
                    { text: "在关系中找到平衡的相互支持", value: 4 }
                ]
            },
            {
                id: 10,
                question: "处理负面情绪时，你通常：",
                options: [
                    { text: "寻找积极的解决方法", value: 1 },
                    { text: "通过分散注意力来缓解", value: 2 },
                    { text: "长时间陷入其中难以自拔", value: 3 },
                    { text: "压抑情绪，假装一切安好", value: 4 }
                ]
            },
            {
                id: 11,
                question: "在做事情时，你对完美的态度是：",
                options: [
                    { text: "尽力而为，接受不完美", value: 1 },
                    { text: "追求完美，害怕失败", value: 2 },
                    { text: "因为怕做不好而拖延或放弃", value: 3 },
                    { text: "在重要事情上追求完美，其他方面随缘", value: 4 }
                ]
            },
            {
                id: 12,
                question: "在社交场合，你通常感觉：",
                options: [
                    { text: "自在轻松，享受与人交流", value: 1 },
                    { text: "需要时间适应，后来逐渐放松", value: 2 },
                    { text: "紧张不自在，担心说错话", value: 3 },
                    { text: "表面正常，内心想尽快离开", value: 4 }
                ]
            },
            {
                id: 13,
                question: "小时候最渴望得到的是：",
                options: [
                    { text: "父母的关注和表扬", value: 1 },
                    { text: "物质上的满足和奖励", value: 2 },
                    { text: "独立自主的空间", value: 3 },
                    { text: "安全感和保护", value: 4 }
                ]
            },
            {
                id: 14,
                question: "面对重大挫折时，你的恢复力：",
                options: [
                    { text: "很快调整，寻找新的机会", value: 1 },
                    { text: "需要一段时间，但最终能走出来", value: 2 },
                    { text: "很长时间受影响，难以释怀", value: 3 },
                    { text: "表面看起来很快恢复，内心依然伤痛", value: 4 }
                ]
            },
            {
                id: 15,
                question: "对自己的未来，你感到：",
                options: [
                    { text: "充满希望和期待", value: 1 },
                    { text: "有所期待但也有担忧", value: 2 },
                    { text: "悲观，觉得很难改变现状", value: 3 },
                    { text: "顺其自然，不强求结果", value: 4 }
                ]
            }
        ];

        let currentQuestion = 0;
        let answers = [];

        // 创建背景爱心装饰
        function createHearts() {
            const heartsContainer = document.getElementById('hearts');
            const heartSymbols = ['❤️', '💕', '💖', '💗', '💝', '💞', '💓'];

            for (let i = 0; i < 15; i++) {
                const heart = document.createElement('div');
                heart.className = 'heart';
                heart.innerHTML = heartSymbols[Math.floor(Math.random() * heartSymbols.length)];
                heart.style.left = Math.random() * 100 + '%';
                heart.style.top = Math.random() * 100 + '%';
                heart.style.fontSize = (Math.random() * 20 + 15) + 'px';
                heart.style.animationDelay = Math.random() * 8 + 's';
                heart.style.opacity = Math.random() * 0.5 + 0.3;
                heartsContainer.appendChild(heart);
            }
        }

        function startTest() {
            document.getElementById('welcomeSection').style.display = 'none';
            document.getElementById('testSection').style.display = 'block';
            currentQuestion = 0;
            answers = [];
            showQuestion();
        }

        function showQuestion() {
            const question = questions[currentQuestion];
            const container = document.getElementById('questionContainer');

            container.innerHTML = `
                <div class="question-card">
                    <div class="question-header">
                        <span class="question-number">${question.id}</span>
                        ${question.question}
                    </div>
                    <div class="options">
                        ${question.options.map((option, index) => `
                            <label class="option">
                                <input type="radio" name="question${question.id}" value="${option.value}" onchange="selectAnswer(${option.value})">
                                <span>${option.text}</span>
                            </label>
                        `).join('')}
                    </div>
                </div>
            `;

            updateProgress();
            updateNavigation();

            // 如果已有答案，显示之前的选择
            if (answers[currentQuestion]) {
                const radio = container.querySelector(`input[value="${answers[currentQuestion]}"]`);
                if (radio) radio.checked = true;
            }
        }

        function selectAnswer(value) {
            answers[currentQuestion] = value;
        }

        function nextQuestion() {
            if (!answers[currentQuestion]) {
                showNotification('请选择一个答案哦 💕');
                return;
            }

            if (currentQuestion < questions.length - 1) {
                currentQuestion++;
                showQuestion();
            } else {
                document.getElementById('nextBtn').style.display = 'none';
                document.getElementById('submitBtn').style.display = 'block';
            }
        }

        function previousQuestion() {
            if (currentQuestion > 0) {
                currentQuestion--;
                showQuestion();
            }
        }

        function showNotification(message) {
            // 创建一个简单的提示框
            const notification = document.createElement('div');
            notification.style.cssText = `
                position: fixed;
                top: 20px;
                left: 50%;
                transform: translateX(-50%);
                background: linear-gradient(45deg, #FF69B4, #FFB6C1);
                color: white;
                padding: 15px 30px;
                border-radius: 25px;
                box-shadow: 0 4px 15px rgba(0,0,0,0.2);
                z-index: 1000;
                animation: fadeIn 0.3s ease;
            `;
            notification.textContent = message;
            document.body.appendChild(notification);

            setTimeout(() => {
                notification.style.animation = 'fadeOut 0.3s ease';
                setTimeout(() => document.body.removeChild(notification), 300);
            }, 2000);
        }

        function updateProgress() {
            const progress = ((currentQuestion + 1) / questions.length) * 100;
            document.getElementById('progressFill').style.width = progress + '%';
        }

        function updateNavigation() {
            const prevBtn = document.getElementById('prevBtn');
            const nextBtn = document.getElementById('nextBtn');
            const submitBtn = document.getElementById('submitBtn');

            prevBtn.disabled = currentQuestion === 0;

            if (currentQuestion === questions.length - 1) {
                nextBtn.style.display = 'none';
                submitBtn.style.display = answers[currentQuestion] ? 'block' : 'none';
            } else {
                nextBtn.style.display = 'block';
                submitBtn.style.display = 'none';
            }
        }

        function calculateScore() {
            return answers.reduce((sum, answer) => sum + answer, 0);
        }

        function showResult() {
            // 检查是否所有题目都已回答
            if (answers.length !== questions.length || answers.includes(undefined)) {
                showNotification('请回答所有题目后再查看结果 💕');
                return;
            }

            const score = calculateScore();
            let resultType, resultContent, warmMessage;

            if (score <= 25) {
                resultType = "🌈 幸福彩虹宝宝";
                resultContent = `
                    <div class="feature-list">
                        <h3>💝 你的童年印记</h3>
                        <p>恭喜你！你的童年就像一道绚丽的彩虹，充满了温暖和色彩。你在爱的环境中长大，建立了健康的依恋关系和积极的人生观。</p>
                    </div>

                    <div class="mbti-section">
                        <h3>🎭 你的性格密码</h3>
                        <p><strong>类型：</strong>阳光型依恋者 + 天生乐观主义者</p>
                        <p><strong>关键词：</strong>安全感强 · 自信满满 · 社交达人 · 情商在线</p>
                        <p>就像向日葵一样，你总是朝着阳光生长，给身边的人带来温暖和正能量。</p>
                    </div>

                    <div class="feature-list">
                        <h3>🌟 你的超能力</h3>
                        <ul>
                            <li>💪 <strong>情绪调节大师：</strong>能够快速从负面情绪中恢复</li>
                            <li>🎯 <strong>天生社交能手：</strong>轻松建立和维护人际关系</li>
                            <li>🔮 <strong>积极思考模式：</strong>总能看到事物美好的一面</li>
                            <li>💕 <strong>健康的边界感：</strong>知道如何保护自己又不伤害他人</li>
                            <li>🌱 <strong>强大的成长心态：</strong>把挑战视为学习机会</li>
                        </ul>
                    </div>

                    <div class="compatibility-section">
                        <h3>💞 完美搭配建议</h3>
                        <p><strong>最适合的朋友类型：</strong>成长型学习者 - 你们的互补性很强！</p>
                        <p><strong>恋爱对象推荐：</strong>同样拥有安全依恋特质的人，或者正在成长路上的探索者</p>
                        <p><strong>需要警惕的关系：</strong>过度依赖型或情感回避型的人</p>
                    </div>

                    <div class="advice-card">
                        <h3>💫 进阶成长指南</h3>
                        <ul>
                            <li>🎈 <strong>保持初心：</strong>继续做那个温暖善良的自己，但要学会设立边界</li>
                            <li>🌍 <strong>拓宽视野：</strong>尝试理解不同类型的人，培养同理心</li>
                            <li>🎨 <strong>挑战舒适区：</strong>偶尔体验一些"不完美"，这会让人生更有趣</li>
                            <li>🤝 <strong>深度关系：</strong>不止于表面交流，学会与他人建立更深的连接</li>
                            <li>🎯 <strong>目标设定：</strong>将你的正能量导向具体的人生目标</li>
                        </ul>
                    </div>

                    <div class="growth-path">
                        <h3>🚀 未来成长路径</h3>
                        <p><strong>第一阶段：</strong>学习一个新技能，挑战自己的舒适区</p>
                        <p><strong>第二阶段：</strong>参与公益活动，用你的温暖帮助他人</p>
                        <p><strong>第三阶段：</strong>建立深度友谊，练习分享自己的脆弱</p>
                        <p><strong>第四阶段：</strong>总结成长，成为他人的精神导师</p>
                    </div>

                    <div class="celebrity-quote">
                        <h3>🌟 名人能量站</h3>
                        <p>"生命的意义不在于你拥有什么，而在于你分享了什么。" —— 海伦·凯勒</p>
                        <p>你的存在就像一个小太阳，照亮了周围的每个人。</p>
                    </div>
                `;
                warmMessage = "亲爱的彩虹宝宝，你本身就是一道美丽的风景线。继续发光发热吧，世界因为有你这样的存在而变得更加美好！记住，你的善良和温暖是这个世界上最珍贵的礼物。";
            } else if (score <= 35) {
                resultType = "🌸 成长花园探险家";
                resultContent = `
                    <div class="feature-list">
                        <h3>💝 你的成长故事</h3>
                        <p>你的童年就像一座美丽的花园，虽然经历了一些风雨，但这些经历让你成长为一朵更加坚韧和智慧的花。你学会了在挑战中寻找力量，在逆境中培养韧性。</p>
                    </div>

                    <div class="mbti-section">
                        <h3>🎭 你的性格密码</h3>
                        <p><strong>类型：</strong>思考型成长者 + 坚韧的实践主义者</p>
                        <p><strong>关键词：</strong>自我反思 · 持续成长 · 适应性强 · 内外平衡</p>
                        <p>就像竹子一样，你能在风雨中弯曲但不会折断，每一次困难都让你变得更加坚强。</p>
                    </div>

                    <div class="feature-list">
                        <h3>🌟 你的成长天赋</h3>
                        <ul>
                            <li>🧠 <strong>超级反思能力：</strong>善于从经历中提取智慧和教训</li>
                            <li>🔄 <strong>强大的适应力：</strong>能够在变化中找到平衡点</li>
                            <li>🎨 <strong>渐进式改进：</strong>知道如何一步步让自己变得更好</li>
                            <li>💭 <strong>深度思考者：</strong>不满足于表面，追求内在的成长</li>
                            <li>⚖️ <strong>平衡艺术大师：</strong>在独立和依赖之间找到完美平衡</li>
                        </ul>
                    </div>

                    <div class="compatibility-section">
                        <h3>💞 最佳组合配方</h3>
                        <p><strong>最适合的朋友：</strong>温暖阳光型 - 他们能给你安全感，你能给他们深度</p>
                        <p><strong>理想伴侣：</strong>要么是同样在成长路上的同道中人，要么是已经成熟的引导者</p>
                        <p><strong>需要避免的关系：</strong>情感上极度不稳定的人</p>
                    </div>

                    <div class="advice-card">
                        <h3>💫 成长加速计划</h3>
                        <ul>
                            <li>🎯 <strong>拥抱不完美：</strong>允许自己犯错，这是成长的必经之路</li>
                            <li>💬 <strong>表达练习：</strong>学会更直接地表达需求和感受</li>
                            <li>🎪 <strong>尝试新体验：</strong>走出舒适区，给生活更多可能性</li>
                            <li>🤝 <strong>建立支持网络：</strong>不要独自承担所有，学会求助</li>
                            <li>🎈 <strong>活在当下：</strong>既要规划未来，也要享受现在的美好</li>
                        </ul>
                    </div>

                    <div class="growth-path">
                        <h3>🚀 未来成长地图</h3>
                        <p><strong>初期：</strong>报名一个感兴趣的课程，投资自己的成长</p>
                        <p><strong>中期：</strong>建立一个新的健康习惯，培养自律</p>
                        <p><strong>后期：</strong>进行一次深度旅行，拓展人生视野</p>
                        <p><strong>收获期：</strong>整理自己的成长历程，总结收获</p>
                    </div>

                    <div class="celebrity-quote">
                        <h3>🌟 名人能量站</h3>
                        <p>"成长不是变得完美，而是变得完整。" —— 卡尔·荣格</p>
                        <p>你的每一步成长都在编织一个独特而美丽的人生故事。</p>
                    </div>
                `;
                warmMessage = "亲爱的成长探险家，你正在创造属于自己的精彩故事。每一步尝试都是勇气的表现，每一次反思都是智慧的积累。相信自己的节奏，你正在成为最好的自己！";
            } else if (score <= 45) {
                resultType = "🌙 温柔月光守护者";
                resultContent = `
                    <div class="feature-list">
                        <h3>💝 你的内心世界</h3>
                        <p>你的童年虽然可能充满了一些阴影，但这些经历让你拥有了比常人更深刻的洞察力和同理心。你就像月亮，即使在黑暗中也能散发出温柔的光芒。</p>
                    </div>

                    <div class="mbti-section">
                        <h3>🎭 你的性格密码</h3>
                        <p><strong>类型：</strong>敏感型感受者 + 坚韧的幸存者</p>
                        <p><strong>关键词：</strong>高度敏感 · 深度共情 · 内在坚韧 · 保护意识强</p>
                        <p>你就像夜空中的星星，虽然在黑暗中，却能指引他人前进的方向。</p>
                    </div>

                    <div class="feature-list">
                        <h3>🌟 你的独特天赋</h3>
                        <ul>
                            <li>🎭 <strong>情感雷达：</strong>能敏锐感知他人的情绪和需求</li>
                            <li>💎 <strong>深刻的洞察力：</strong>能看透事物的本质和人的内心</li>
                            <li>🛡️ <strong>强大的保护本能：</strong>既有自我保护意识，也能保护他人</li>
                            <li>🎨 <strong>丰富的内心世界：</strong>拥有独特的想象力和创造力</li>
                            <li>🌱 <strong>惊人的恢复力：</strong>虽然受伤但总能重新站起来</li>
                        </ul>
                    </div>

                    <div class="compatibility-section">
                        <h3>💞 灵魂伴侣指南</h3>
                        <p><strong>最适合的朋友：</strong>同样敏感但更稳定的人，或者能给你安全感的阳光型</p>
                        <p><strong>理想伴侣：</strong>理解你敏感特质、愿意给你安全感的人</p>
                        <p><strong>需要警惕的关系：</strong>情感麻木、不懂边界的人</p>
                    </div>

                    <div class="advice-card">
                        <h3>💫 自我呵护指南</h3>
                        <ul>
                            <li>🌸 <strong>建立安全区：</strong>创造一个让自己感到安全的环境</li>
                            <li>🎪 <strong>小步前进：</strong>在安全范围内逐步尝试新的事物</li>
                            <li>🤝 <strong>寻找同盟：</strong>找到真正理解和支持你的人</li>
                            <li>🎨 <strong>表达创作：</strong>通过艺术、写作等方式表达内心</li>
                            <li>🌙 <strong>自我关怀：</strong>学会像对待最好的朋友那样对待自己</li>
                        </ul>
                    </div>

                    <div class="growth-path">
                        <h3>🚀 未来疗愈之旅</h3>
                        <p><strong>第一阶段：</strong>尝试心理日记，记录自己的情绪和想法</p>
                        <p><strong>第二阶段：</strong>学习冥想或瑜伽，培养内在平静</p>
                        <p><strong>第三阶段：</strong>考虑专业的心理咨询，获得专业支持</p>
                        <p><strong>第四阶段：</strong>创作一些能表达自己的艺术作品</p>
                    </div>

                    <div class="celebrity-quote">
                        <h3>🌟 名人能量站</h3>
                        <p>"伤口是光进入你内心的地方。" —— 鲁米</p>
                        <p>你的敏感不是弱点，而是能够感受世界美好的超能力。</p>
                    </div>
                `;
                warmMessage = "亲爱的月光守护者，你的敏感是一种天赋，你的坚强令人敬佩。在黑暗中摸索的你，其实一直在发光。请记住，你值得被温柔对待，更值得给自己最大的温柔。";
            } else {
                resultType = "🌟 凤凰涅槃重生者";
                resultContent = `
                    <div class="feature-list">
                        <h3>💝 你的英雄之旅</h3>
                        <p>你经历了常人难以想象的困难，但依然坚强地站在这里。你就像传说中的凤凰，在烈火中重生，拥有无与伦比的生命力和智慧。你的存在本身就是一个奇迹。</p>
                    </div>

                    <div class="mbti-section">
                        <h3>🎭 你的性格密码</h3>
                        <p><strong>类型：</strong>重生型智者 + 超级幸存者</p>
                        <p><strong>关键词：</strong>生命力顽强 · 洞察深刻 · 真诚勇敢 · 潜力无限</p>
                        <p>你就像深海中的珍珠，经历了巨大的压力和痛苦，却成为了最珍贵美丽的样子。</p>
                    </div>

                    <div class="feature-list">
                        <h3>🌟 你的超凡能力</h3>
                        <ul>
                            <li>🔥 <strong>超强生命力：</strong>在绝境中生存和成长的神奇能力</li>
                            <li>👁️ <strong>深刻的人性洞察：</strong>能理解人性的复杂和深度</li>
                            <li>💎 <strong>纯粹的心灵：</strong>一旦信任，就会全心全意地付出</li>
                            <li>🌈 <strong>无限潜力：</strong>拥有改变现状、创造新生活的巨大能量</li>
                            <li>✨ <strong>灵性智慧：</strong>从苦难中提炼出的人生智慧</li>
                        </ul>
                    </div>

                    <div class="compatibility-section">
                        <h3>💞 灵魂伴侣类型</h3>
                        <p><strong>最适合的朋友：</strong>有同样经历但更稳定的人，或者能给你无条件支持的人</p>
                        <p><strong>理想伴侣：</strong>有足够成熟度、能理解你过去并珍视你现在的人</p>
                        <p><strong>需要避免的关系：</strong>任何形式的控制和虐待关系</p>
                    </div>

                    <div class="advice-card">
                        <h3>💫 重生计划</h3>
                        <ul>
                            <li>🏥 <strong>专业支持：</strong>寻找经验丰富的心理治疗师，这是最重要的投资</li>
                            <li>🛡️ <strong>安全环境：</strong>创造一个完全安全的生活环境</li>
                            <li>🤝 <strong>支持小组：</strong>加入有相似经历者的支持团体</li>
                            <li>🎨 <strong>创造性疗愈：</strong>通过写作、绘画、音乐等方式表达和治愈</li>
                            <li>🌱 <strong>重新成长：</strong>给自己机会重新体验"健康的童年"</li>
                        </ul>
                    </div>

                    <div class="growth-path">
                        <h3>🚀 未来重生时间线</h3>
                        <p><strong>第一阶段：</strong>建立安全基地，找到专业支持</p>
                        <p><strong>第二阶段：</strong>开始创伤治疗，学习情绪管理</p>
                        <p><strong>第三阶段：</strong>重建人际关系，练习信任</p>
                        <p><strong>第四阶段：</strong>发现新的生活意义和目标</p>
                    </div>

                    <div class="celebrity-quote">
                        <h3>🌟 名人能量站</h3>
                        <p>"没有经历过黑暗的人，无法真正理解光明的珍贵。" —— 海明威</p>
                        <p>你的故事将成为他人的希望，你的坚强将启发无数的人。</p>
                    </div>
                `;
                warmMessage = "亲爱的重生者，你走过了常人无法想象的路，却依然保持着内心的光芒。你的存在证明了人类精神的伟大。请记住，疗愈是一个过程，不是终点。你已经走过了最艰难的路，接下来的每一天都是美好的开始。";
            }

            // 显示结果
            document.getElementById('testSection').style.display = 'none';
            document.getElementById('resultSection').style.display = 'block';
            document.getElementById('resultType').textContent = resultType;
            document.getElementById('scoreDisplay').textContent = `你的童年印记得分：${score}分 🎪`;
            document.getElementById('resultContent').innerHTML = resultContent;
            document.getElementById('warmMessage').textContent = warmMessage;

            // 滚动到页面顶部
            window.scrollTo({ top: 0, behavior: 'smooth' });
        }

        function restartTest() {
            currentQuestion = 0;
            answers = [];
            document.getElementById('resultSection').style.display = 'none';
            document.getElementById('welcomeSection').style.display = 'block';
            window.scrollTo({ top: 0, behavior: 'smooth' });
        }

        // 页面加载时创建装饰
        window.onload = function() {
            createHearts();
        };
    </script>
</body>
</html>
