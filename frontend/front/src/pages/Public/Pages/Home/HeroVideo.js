import React, { useState, useEffect } from "react";
import { styled } from "@mui/material/styles";
import { Typography, Box, Link } from "@mui/material";

import ButtonGetPump from "../../Components/ButtonGetPump";
import AnimatedBox from "../../Components/AnimatedBox";

const HeroWrapper = styled("div")(({ theme }) => ({
  display: "flex",
  alignItems: "center",
  overflow: "hidden",
  height: "calc(100vh - 115px)",
  maxHeight: "850px",
  position: "relative",
  "& .text-wrapper": {
    width: "100vw",
    display: "flex",
    flexDirection: "column",
    justifyContent: "center",
    alignContent: "center",
    position: "absolute",
    boxSizing: "border-box",
  },
  "& .text-overlay": {
    color: "var(--color-text-2)",
    textAlign: "center",
    zIndex: 1,
  },
}));

const VideoContainer = styled("div")({
  display: "flex",
  alignItems: "center",
  justifyContent: "center",
  top: 0,
  left: 0,
  margin: "0 auto",
  height: "100%",
  width: "100%",
  opacity: 0.7,
  background: "var(--bgColor-12)",
  "& .component-video": {
    width: "100%",
    height: "100%",
    overflow: "hidden",
  },
  "& .component-video video": {
    width: "100%",
    height: "100%",
    maxHeight: "100%",
    objectFit: "cover",
  },
});

const HeroVideo = ({ title, videoBgGround }) => {
  const [isMounted, setIsMounted] = useState(false);

  useEffect(() => {
    setTimeout(() => setIsMounted(true), 500);
  }, []);

  return (
    <HeroWrapper sx={{ background: "var(--accent-3)" }}>
      <Box className="text-wrapper" px={4}>
        <AnimatedBox
          isMounted={isMounted}
          delay={400}
          animation="fadeInUp"
          className="text-overlay"
        >
          <Box sx={{ textShadow: "1px 1px 2px #000" }}>
            <Typography variant="titleHero">{title.toUpperCase()}</Typography>

            <Typography variant="bodyHero" mb={7}>
              Heat pumps can help you{" "}
              <Link
                href="https://www.masssave.com/residential/programs-and-services/income-based-offers/income-eligible-programs"
                target="_blank"
                rel="noopener"
                sx={{ color: "var(--color-text-5)", fontWeight: "800" }}
              >
                save money
              </Link>{" "}
              on your home heating and cooling costs.
            </Typography>
          </Box>
          <ButtonGetPump variant="getpump" />
        </AnimatedBox>
      </Box>

      <VideoContainer className="component-video">
        <video
          autoPlay
          loop
          muted
          src={videoBgGround}
          poster="../../../../assets/images/videoCover.png"
        />
      </VideoContainer>
    </HeroWrapper>
  );
};

export default HeroVideo;
