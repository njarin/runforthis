class About extends React.Component {

  render() {
    return (
      <div className="about-page">
        <div className="about-us-section">
          <h2>
            The Team
          </h2>
          <div className="column about-nick">
            Nick Jarin is a web developer with a passion for politics and storytelling. When he isn't coding, you'll find him working on the <a href="http://nw-nerd.com/" target="_blank">NW NERD</a> podcast.
            <p>
              <a href="https://github.com/njarin" target="_blank">
                <img src="github-logo.png" alt="GitHub"></img>
              </a>
              <a href="https://www.linkedin.com/in/nickjarin/" target="_blank">
                <img src="linkedin-letters.png" alt="LinkedIn"></img>
              </a>
          </p>
          </div>
          <div className="column">
            Dan McKeon uses his web developer skills for good, including his other projects like <a href="http://www.crconnect.org/" target="_blank">Cancer Research Connect</a>. When he isn't behind a keyboard, he prefers to be up on a mountain.
            <p>
              <a href="https://github.com/danmckeon" target="_blank">
                <img src="github-logo.png" alt="GitHub"></img>
              </a>
              <a href="https://www.linkedin.com/in/danmckeon/" target="_blank">
                <img src="linkedin-letters.png" alt="LinkedIn"></img>
              </a>
            </p>
          </div>
        </div>
      </div>
    )
  }
};
