import React, { useState, useEffect } from 'react';
import { View, Text, StyleSheet, ViewStyle, TextStyle } from 'react-native';

type ClockWidgetProps = {
  backgroundColor?: string;
  textColor?: string;
  fontSize?: number;
  showSeconds?: boolean;
  fontFamily?: string;
  containerStyle?: ViewStyle;
  textStyle?: TextStyle;
};

const ClockWidget = ({
  backgroundColor = '#1e1e1e',
  textColor = '#00ffcc',
  fontSize = 36,
  showSeconds = true,
  fontFamily = 'Courier',
  containerStyle = {},
  textStyle = {},
}: ClockWidgetProps) => {
  const [time, setTime] = useState(new Date());

  useEffect(() => {
    const timer = setInterval(() => setTime(new Date()), 1000);
    return () => clearInterval(timer);
  }, []);

  const formattedTime = time.toLocaleTimeString([], {
    hour: '2-digit',
    minute: '2-digit',
    second: showSeconds ? '2-digit' : undefined,
  });

  return (
    <View style={[styles.container, { backgroundColor }, containerStyle]}>
      <Text
        style={[
          styles.time,
          {
            color: textColor,
            fontSize,
            fontFamily,
          },
          textStyle,
        ]}
      >
        {formattedTime}
      </Text>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    padding: 20,
    borderRadius: 16,
    alignItems: 'center',
    justifyContent: 'center',
    shadowColor: '#000',
    shadowOpacity: 0.2,
    shadowRadius: 6,
    elevation: 4,
    minWidth: 200,
  },
  time: {
    fontWeight: 'bold',
  },
});

export default ClockWidget;
