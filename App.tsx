import React from 'react';
import { View, StyleSheet } from 'react-native';
import ClockWidget from './components/ClockWidget';

export default function App() {
  return (
    <View style={styles.container}>
      <ClockWidget
        backgroundColor="#222"
        textColor="#00ffcc"
        fontSize={42}
        showSeconds={true}
        fontFamily="Courier"
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#121212',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
