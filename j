;let canvaserY;
let play
let computerY;
let ballX;
let ballY;
let ballSpeedX;
let ballSpeedY;
const paddleWidth = 10;
const paddleHeight = 100;
const paddleSpeed = 5;
const ballSize = 10;

function setup() {
  canvas = createCanvas(800, 400);
  playerY = height / 2 - paddleHeight / 2;
  computerY = height / 2 - paddleHeight / 2;
  ballX = width / 2;
  ballY = height / 2;
  ballSpeedX = 5;
  ballSpeedY = 2;
}

function draw() {
  background(0);

  // Draw paddles
  fill(255);
  rect(0, playerY, paddleWidth, paddleHeight);
  rect(width - paddleWidth, computerY, paddleWidth, paddleHeight);

  // Draw ball
  fill(255);
  ellipse(ballX, ballY, ballSize);

  // Update ball position
  ballX += ballSpeedX;
  ballY += ballSpeedY;

  // Ball collision with top and bottom walls
  if (ballY + ballSize > height || ballY - ballSize < 0) {
    ballSpeedY *= -1;
  }

  // Ball collision with paddles
  if (
    ballX - ballSize < paddleWidth &&
    ballY > playerY &&
    ballY < playerY + paddleHeight
  ) {
    ballSpeedX *= -1;
  }

  if (
    ballX + ballSize > width - paddleWidth &&
    ballY > computerY &&
    ballY < computerY + paddleHeight
  ) {
    ballSpeedX *= -1;
  }

  // Computer AI
  const computerCenter = computerY + paddleHeight / 2;
  if (computerCenter < ballY - 35) {
    computerY += paddleSpeed;
  } else if (computerCenter > ballY + 35) {
    computerY -= paddleSpeed;
  }

  // Ball out of bounds
  if (ballX < 0 || ballX > width) {
    // Reset ball position
    ballX = width / 2;
    ballY = height / 2;
    ballSpeedX *= -1;
  }
}

function mouseMoved() {
  playerY = mouseY - paddleHeight / 2;
}